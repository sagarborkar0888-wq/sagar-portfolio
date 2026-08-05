import 'package:flutter/material.dart';

class ContactWorkflowCard extends StatelessWidget {
  final bool isDark;

  const ContactWorkflowCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);

    final steps = [
      {"num": "01", "title": "Tell Me Your Idea"},
      {"num": "02", "title": "Discuss Requirements"},
      {"num": "03", "title": "Development"},
      {"num": "04", "title": "Testing & Refinement"},
      {"num": "05", "title": "Delivery"},
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
            "⚡ How We Work",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: steps.asMap().entries.map((entry) {
                final idx = entry.key;
                final step = entry.value;
                final isLast = idx == steps.length - 1;

                return Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.04)
                            : const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            step["num"]!,
                            style: const TextStyle(
                              color: Color(0xFF2563EB),
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            step["title"]!,
                            style: TextStyle(
                              color: textColor,
                              fontSize: 11.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!isLast)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: Icon(
                          Icons.chevron_right,
                          color: isDark ? Colors.white38 : Colors.black26,
                          size: 18,
                        ),
                      ),
                  ],
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 14),
          Divider(color: isDark ? Colors.white10 : Colors.black12),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            runSpacing: 6,
            children: [
              _buildWorkflowMeta(
                Icons.timer_outlined,
                "Response: Within 24 hours",
              ),
              _buildWorkflowMeta(
                Icons.schedule_outlined,
                "Working Hours: Flexible",
              ),
              _buildWorkflowMeta(
                Icons.star_outline,
                "Projects: Limited for quality",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWorkflowMeta(IconData icon, String text) {
    final subTextColor = isDark ? Colors.white70 : const Color(0xFF475569);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: subTextColor, size: 13),
        const SizedBox(width: 5),
        Text(text, style: TextStyle(color: subTextColor, fontSize: 11.5)),
      ],
    );
  }
}
