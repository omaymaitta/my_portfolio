import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CVViewerPage extends StatelessWidget {
  const CVViewerPage({super.key});

  static const String cvUrl =
      'https://drive.google.com/file/d/14UJ5EVabtHvFVGNtW8o-uGrJY_Hf2tEj/view?usp=drive_link';

  Future<void> _openCV(BuildContext context) async {
    final uri = Uri.parse(cvUrl);

    final launched = await launchUrl(
      uri,
      mode: kIsWeb ? LaunchMode.platformDefault : LaunchMode.externalApplication,
      webOnlyWindowName: kIsWeb ? '_blank' : null,
    );

    if (!launched && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open CV link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My CV')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Open my latest CV on Google Drive',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _openCV(context),
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('View My CV'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
