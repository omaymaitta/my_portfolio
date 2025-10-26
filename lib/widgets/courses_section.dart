import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';
import 'package:photo_view/photo_view.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../data/profile_data.dart';

class CoursesSection extends StatefulWidget {
  const CoursesSection({super.key});

  @override
  State<CoursesSection> createState() => _CoursesSectionState();
}

class _CoursesSectionState extends State<CoursesSection> {
  late final PageController _controller;
  int _index = 0;

  Timer? _autoTimer;
  Timer? _resumeDelay;

  final Map<String, Future<PdfPageImage?>> _thumbnailFutures = {};

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.85);
    _startAutoplay();

    for (var course in ProfileData.courses) {
      final file = course.image;
      if (file != null && file.toLowerCase().endsWith('.pdf')) {
        _getThumbnail(file).ignore();
      }
    }
  }

  @override
  void dispose() {
    _cancelAutoplay();
    _cancelResumeDelay();
    _controller.dispose();
    _thumbnailFutures.clear();
    super.dispose();
  }

  // ===== Autoplay logic =====
  void _startAutoplay() {
    if (_autoTimer?.isActive == true || ProfileData.courses.isEmpty) return;
    _autoTimer = Timer.periodic(const Duration(seconds: 4), (_) {
      if (!_controller.hasClients) return;
      final next = (_index + 1) % ProfileData.courses.length;
      _controller.animateToPage(
        next,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    });
  }

  void _cancelAutoplay() {
    _autoTimer?.cancel();
    _autoTimer = null;
  }

  void _cancelResumeDelay() {
    _resumeDelay?.cancel();
    _resumeDelay = null;
  }

  void _pauseForUser() {
    _cancelAutoplay();
    _cancelResumeDelay();
  }

  void _resumeAfterDelay([Duration delay = const Duration(seconds: 5)]) {
    _cancelResumeDelay();
    _resumeDelay = Timer(delay, _startAutoplay);
  }

  Future<PdfPageImage?> _renderFirstPage(String assetPath) async {
    try {
      final document = await PdfDocument.openAsset(assetPath);
      final page = await document.getPage(1);
      final pageImage = await page.render(
        width: 600,
        height: 800,
        format: PdfPageImageFormat.jpeg,
        backgroundColor: '#FFFFFF',
      );
      await page.close();
      await document.close();
      return pageImage;
    } catch (e) {
      debugPrint('PDF render error: $e');
      return null;
    }
  }

  Future<PdfPageImage?> _getThumbnail(String assetPath) {
    final key = assetPath;
    _thumbnailFutures[key] ??= _renderFirstPage(assetPath);
    return _thumbnailFutures[key]!;
  }

  @override
  Widget build(BuildContext context) {
    if (ProfileData.courses.isEmpty) {
      return const Center(child: Text("No courses available"));
    }

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final dotColor = isDark ? Colors.white70 : Colors.black54;

    final width = MediaQuery.of(context).size.width;
    final height = width < 600 ? 220.0 : min(380.0, width * 0.35);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ===== Carousel =====
        SizedBox(
          height: height,
          child: GestureDetector(
            onPanDown: (_) => _pauseForUser(),
            onPanCancel: _startAutoplay,
            onPanEnd: (_) => _resumeAfterDelay(),
            child: PageView.builder(
              controller: _controller,
              itemCount: ProfileData.courses.length,
              onPageChanged: (i) => setState(() => _index = i),
              itemBuilder: (context, i) {
                final course = ProfileData.courses[i];
                final isPdf = course.image!.toLowerCase().endsWith(".pdf");
                final thumbnailFuture = isPdf ? _getThumbnail(course.image!) : null;
                return GestureDetector(
                  onTap: () => _openCourse(context, course.image!, course.title),
                  child: AnimatedScale(
                    scale: i == _index ? 1.0 : 0.93,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: _ImageCard(
                      filePath: course.image!,
                      title: course.title,
                      thumbnailFuture: thumbnailFuture,
                    ),
                  ),
                );
              },
            ),
          ),
        ),

        const SizedBox(height: 14),

        // ===== Indicators =====
        Center(
          child: Wrap(
            spacing: 6,
            children: List.generate(
              ProfileData.courses.length,
                  (i) => GestureDetector(
                onTap: () {
                  _pauseForUser();
                  _controller.animateToPage(
                    i,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                  _resumeAfterDelay();
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  height: 8,
                  width: i == _index ? 24 : 8,
                  decoration: BoxDecoration(
                    color: i == _index ? Colors.tealAccent : dotColor.withOpacity(0.35),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _openCourse(BuildContext context, String file, String title) {
    if (file.toLowerCase().endsWith(".pdf")) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => PdfViewerPage(filePath: file, title: title),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ImageViewerPage(filePath: file, title: title),
        ),
      );
    }
  }
}

// ===== Card for carousel =====
class _ImageCard extends StatelessWidget {
  final String filePath;
  final String title;
  final Future<PdfPageImage?>? thumbnailFuture;

  const _ImageCard({
    required this.filePath,
    required this.title,
    this.thumbnailFuture,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final border = isDark ? Colors.white24 : Colors.black12;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: border, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          Positioned.fill(
            child: _buildThumbnail(context),
          ),

          // ---------- Dark gradient overlay  ----------
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          // ---------- Title----------
          Positioned(
            left: 14,
            bottom: 14,
            right: 14,
            child: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black54,
                    offset: Offset(1, 1),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThumbnail(BuildContext context) {
    final isPdf = filePath.toLowerCase().endsWith('.pdf');
    if (!isPdf) {
      // For non-PDF
      return Image.asset(
        filePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _errorPlaceholder(),
      );
    } else {
      // For PDF: future
      return FutureBuilder<PdfPageImage?>(
        future: thumbnailFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData && snapshot.data != null) {
              return Image.memory(
                snapshot.data!.bytes,
                fit: BoxFit.cover,
                gaplessPlayback: true,
              );
            } else {
              // PDF failed to render
              return _errorPlaceholder();
            }
          }
          // Loading state
          return Container(
            color: Colors.grey.shade800,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white54),
            ),
          );
        },
      );
    }
  }

  Widget _errorPlaceholder() {
    return Container(
      color: Colors.grey.shade800,
      child: const Center(
        child: Icon(Icons.picture_as_pdf, color: Colors.white54, size: 48),
      ),
    );
  }
}

/// PDF Viewer Page
class PdfViewerPage extends StatelessWidget {
  final String filePath;
  final String title;
  const PdfViewerPage({super.key, required this.filePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SfPdfViewer.asset(filePath),
    );
  }
}

/// Image Fullscreen Viewer
class ImageViewerPage extends StatelessWidget {
  final String filePath;
  final String title;
  const ImageViewerPage({super.key, required this.filePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: PhotoView(
        imageProvider: AssetImage(filePath),
        backgroundDecoration: const BoxDecoration(color: Colors.black),
      ),
    );
  }
}