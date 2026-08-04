import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class AnimatedStatCounterGrid extends StatelessWidget {
  const AnimatedStatCounterGrid({super.key});

  static const List<Map<String, dynamic>> _stats = [
    {'count': 1, 'suffix': '+', 'label': 'Social App Built'},
    {'count': 20, 'suffix': '+', 'label': 'Screens Designed'},
    {'count': 8, 'suffix': '+', 'label': 'Tech Stack Tools'},
    {'count': 100, 'suffix': '%', 'label': 'Production Ready'},
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return RepaintBoundary(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark
              ? AppTheme.darkSurface.withValues(alpha: 0.6)
              : Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 500;
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _stats.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isWide ? 4 : 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isWide ? 1.6 : 1.5,
              ),
              itemBuilder: (context, index) {
                final stat = _stats[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween<double>(
                        begin: 0,
                        end: (stat['count'] as int).toDouble(),
                      ),
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutCubic,
                      builder: (context, value, child) {
                        return ShaderMask(
                          shaderCallback: (bounds) =>
                              AppTheme.primaryGradient.createShader(bounds),
                          child: Text(
                            '${value.toInt()}${stat['suffix']}',
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Text(
                      stat['label'] as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: isDark ? Colors.white70 : Colors.black54,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
