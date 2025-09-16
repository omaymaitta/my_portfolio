// lib/widgets/skills_section.dart
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    super.key,
    this.skills, // optional override
  });

  /// Optional: pass a custom list from outside (e.g., from ProfileData).
  final List<_Skill>? skills;

  // Default set (includes frontend + APIs gained at Springer Capital)
  List<_Skill> get _defaultSkills => const [
    // Mobile / Flutter
    _Skill(name: "Flutter", level: 0.90),
    _Skill(name: "Dart", level: 0.80),
    _Skill(name: "Firebase", level: 0.60),

    // APIs / Data
    _Skill(name: "REST APIs", level: 0.80),
    _Skill(name: "MySQL", level: 0.80),

    // Frontend Web
    _Skill(name: "React", level: 0.50),
    _Skill(name: "CSS", level: 0.70),
    _Skill(name: "HTML", level: 0.90),

    // Backend Web
    _Skill(name: "Node.js", level: 0.70),
    _Skill(name: "JavaScript", level: 0.80),
    _Skill(name: "PHP", level: 0.80),
    _Skill(name: "Django", level: 0.60),
    _Skill(name: "Python", level: 0.70),
    _Skill(name: "Java", level: 0.80),
    _Skill(name: "Spring Boot", level: 0.70),


    // Quality / Perf / DevEx
    _Skill(name: "Performance Optimization", level: 0.70),
    _Skill(name: "Git/GitHub/GitLab & CI/CD", level: 0.70),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final list = skills ?? _defaultSkills;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text("💻 ",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(
              "Skills",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        LayoutBuilder(
          builder: (context, constraints) {
            final cols = constraints.maxWidth >= 700 ? 2 : 1;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: cols,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                mainAxisExtent: 92,
              ),
              itemCount: list.length,
              itemBuilder: (context, i) {
                final skill = list[i];
                return FadeInUp(
                  duration: Duration(milliseconds: 350 + (i * 40)),
                  child: _SkillCard(skill: skill, isDark: isDark),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class _SkillCard extends StatefulWidget {
  const _SkillCard({required this.skill, required this.isDark});
  final _Skill skill;
  final bool isDark;

  @override
  State<_SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<_SkillCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final bg = widget.isDark
        ? Colors.white.withOpacity(.06)
        : Colors.black.withOpacity(.04);
    final border = widget.isDark ? Colors.white24 : Colors.black12;
    final accent = _pickAccent(widget.skill.name);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: border),
          boxShadow: _hovered
              ? [
            BoxShadow(
              color: Colors.black.withOpacity(.18),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 6,
                    height: 24,
                    decoration: BoxDecoration(
                      color: accent,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      widget.skill.name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Text(
                    '${(widget.skill.level * 100).round()}%',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, c) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Container(
                          height: 10,
                          width: c.maxWidth,
                          color: Colors.white.withOpacity(.14),
                        ),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(
                            begin: 0,
                            end: widget.skill.level.clamp(0.0, 1.0),
                          ),
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOutCubic,
                          builder: (context, value, _) {
                            return Container(
                              height: 10,
                              width: c.maxWidth * value,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    accent.withOpacity(.95),
                                    accent.withOpacity(.70),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _pickAccent(String name) {
    final hash =
    name.codeUnits.fold<int>(0, (p, c) => (p * 31 + c) & 0x7fffffff);
    final palette = <Color>[
      Colors.tealAccent.shade400,
      Colors.lightBlueAccent.shade200,
      Colors.purpleAccent.shade200,
      Colors.amberAccent.shade200,
      Colors.greenAccent.shade200,
      Colors.pinkAccent.shade200,
      Colors.cyanAccent.shade200,
    ];
    return palette[hash % palette.length];
  }
}

class _Skill {
  final String name;
  final double level;
  const _Skill({required this.name, required this.level});
}
