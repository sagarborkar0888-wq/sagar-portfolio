import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class CareerTimelineWidget extends StatelessWidget {
  const CareerTimelineWidget({super.key});

  static const List<Map<String, String>> _milestones = [
    {
      'year': '2023',
      'title': 'Learning Flutter & Mobile Core',
      'desc':
          'Mastered cross-platform architecture, Dart null safety, state management, and responsive UI design.',
    },
    {
      'year': '2024',
      'title': 'Building Production Apps',
      'desc':
          'Developed 20+ responsive screens, custom widgets, REST API layers, and Cloudinary media integrations.',
    },
    {
      'year': '2025',
      'title': 'Launching SocialProX',
      'desc':
          'Architected & launched SocialProX, a full-stack social network featuring real-time chat, media feeds, and Supabase auth.',
    },
    {
      'year': '2026+',
      'title': 'Scaling & Full-Stack Leadership',
      'desc':
          'Expanding mobile and web engineering, enterprise Flutter Web, and full-stack software development.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark
              ? AppTheme.darkSurface.withValues(alpha: 0.6)
              : Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.timeline_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                Expanded(
                  child: Text(
                    'Career Journey & Timeline',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Column(
              children: _milestones.asMap().entries.map((entry) {
                final index = entry.key;
                final milestone = entry.value;
                final isLast = index == _milestones.length - 1;

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Year Badge & Vertical Line
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            gradient: AppTheme.primaryGradient,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            milestone['year']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (!isLast)
                          Container(
                            width: 2,
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    // Milestone Details
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              milestone['title']!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isDark ? Colors.white : Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              milestone['desc']!,
                              style: TextStyle(
                                fontSize: 14,
                                color: isDark ? Colors.white70 : Colors.black54,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
