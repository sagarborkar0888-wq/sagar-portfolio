import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class RoleBadges extends StatelessWidget {
  const RoleBadges({super.key});

  static const List<Map<String, dynamic>> roles = [
    {'title': 'Full Stack App Developer', 'icon': Icons.code_rounded},
    {'title': 'Flutter & Android Lead', 'icon': Icons.android_rounded},
    {'title': 'Founder @ SocialProX', 'icon': Icons.rocket_launch_rounded},
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: roles.map((role) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: AppTheme.darkSurface.withValues(alpha: 0.8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppTheme.primaryBlue.withValues(alpha: 0.3),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppTheme.primaryBlue.withValues(alpha: 0.08),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                role['icon'] as IconData,
                size: 16,
                color: AppTheme.primaryBlue,
              ),
              const SizedBox(width: 6),
              Text(
                role['title'] as String,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.2,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
