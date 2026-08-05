import 'package:flutter/material.dart';

class ContactServicesGrid extends StatelessWidget {
  final bool isDark;

  const ContactServicesGrid({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white60 : const Color(0xFF475569);

    final services = [
      {
        "icon": Icons.phone_android,
        "title": "Full Stack App Development",
        "desc": "Cross-platform iOS & Android mobile apps",
      },
      {
        "icon": Icons.palette_outlined,
        "title": "Modern UI/UX Design",
        "desc": "Clean Material 3 & user-centric layouts",
      },
      {
        "icon": Icons.cloud_sync_outlined,
        "title": "Backend Integration",
        "desc": "Supabase, Cloudinary, REST APIs & databases",
      },
      {
        "icon": Icons.speed_outlined,
        "title": "Performance & Bug Fixing",
        "desc": "60 FPS smooth scrolling & optimization",
      },
      {
        "icon": Icons.shop_two_outlined,
        "title": "Play Store Deployment",
        "desc": "App release management & publishing",
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF0F111A) : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.06),
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
          Text(
            "💼 Services I Offer",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth >= 460;
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: services.map((service) {
                  return SizedBox(
                    width: isWide
                        ? (constraints.maxWidth - 10) / 2
                        : double.infinity,
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.03)
                            : const Color(0xFFF8FAFC),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : Colors.black.withValues(alpha: 0.05),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFF8B5CF6,
                              ).withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              service["icon"] as IconData,
                              color: const Color(0xFF7C3AED),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service["title"] as String,
                                  style: TextStyle(
                                    color: textColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  service["desc"] as String,
                                  style: TextStyle(
                                    color: subTextColor,
                                    fontSize: 11.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
