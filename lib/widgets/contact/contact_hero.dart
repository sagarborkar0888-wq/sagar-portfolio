import 'package:flutter/material.dart';

class ContactHero extends StatelessWidget {
  final bool isDark;

  const ContactHero({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white70 : const Color(0xFF475569);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 650;
    final avatarRadius = isMobile ? 60.0 : 67.5;
    final avatarSize = avatarRadius * 2;

    return Column(
      children: [
        // Avatar Image
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF3B82F6), Color(0xFF8B5CF6)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF3B82F6).withValues(alpha: 0.35),
                blurRadius: 24,
                spreadRadius: 3,
              ),
            ],
          ),
          padding: const EdgeInsets.all(3),
          child: ClipOval(
            child: SizedBox(
              width: avatarSize,
              height: avatarSize,
              child: Image.asset(
                'assets/images/sagar_persional_photo_3.webp',
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.person,
                  size: avatarRadius,
                  color: isDark ? Colors.white70 : Colors.black54,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 14),

        // Availability Badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: const Color(0xFF10B981).withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFF10B981).withValues(alpha: 0.3),
            ),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: Color(0xFF10B981), size: 9),
              SizedBox(width: 6),
              Text(
                "Available for Freelance & Collaboration",
                style: TextStyle(
                  color: Color(0xFF059669),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),

        // Title
        Text(
          "Let’s Work Together 🚀",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: textColor,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 6),

        // Subtitle
        Text(
          "Turning ideas into powerful digital experiences.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15,
            color: subTextColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
