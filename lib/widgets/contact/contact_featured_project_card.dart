import 'package:flutter/material.dart';

class ContactFeaturedProjectCard extends StatelessWidget {
  final bool isDark;
  final Function(String) onLaunch;

  const ContactFeaturedProjectCard({
    super.key,
    required this.isDark,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white70 : const Color(0xFF475569);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F111A) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.4),
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.5)
                : Colors.black.withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🚀 Featured Project",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  letterSpacing: 0.2,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Play Store",
                  style: TextStyle(
                    color: Color(0xFF2563EB),
                    fontSize: 10.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "SocialProX",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "A social media platform built with Flutter and backend technologies.",
            style: TextStyle(color: subTextColor, fontSize: 12.5),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _buildFeatureChip("Posts", isDark),
              _buildFeatureChip("Likes", isDark),
              _buildFeatureChip("Comments", isDark),
              _buildFeatureChip("Chat", isDark),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildTechChip("Flutter"),
              const SizedBox(width: 6),
              _buildTechChip("Supabase"),
              const SizedBox(width: 6),
              _buildTechChip("Cloudinary"),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              onPressed: () => onLaunch(
                "https://play.google.com/store/apps/details?id=com.socialprox.app",
              ),
              icon: const Text(
                "View Project",
                style: TextStyle(
                  color: Color(0xFF2563EB),
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              label: const Icon(
                Icons.arrow_forward,
                color: Color(0xFF2563EB),
                size: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildFeatureChip(String label, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        "• $label",
        style: TextStyle(
          color: isDark ? Colors.white : const Color(0xFF334155),
          fontSize: 11.5,
        ),
      ),
    );
  }

  static Widget _buildTechChip(String tech) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3.5),
      decoration: BoxDecoration(
        color: const Color(0xFF8B5CF6).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        tech,
        style: const TextStyle(
          color: Color(0xFF7C3AED),
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
