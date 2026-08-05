import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';
import '../widgets/legal/legal_section_card.dart';
import '../widgets/scroll_progress_indicator.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final ScrollController _scrollController = ScrollController();

  static const List<Map<String, dynamic>> _sections = [
    {
      "num": "01",
      "title": "Introduction",
      "icon": Icons.info_outline,
      "items": [
        "This policy applies to all users of this platform.",
        "We respect your privacy and protect your data.",
        "This policy explains how we collect, use, and protect your information.",
      ],
    },
    {
      "num": "02",
      "title": "Data We Collect",
      "icon": Icons.folder_open_outlined,
      "items": [
        "Name and email address",
        "Phone number (if provided)",
        "Profile picture",
        "Device and usage data",
        "Location (if provided)",
      ],
    },
    {
      "num": "03",
      "title": "How We Use Data",
      "icon": Icons.settings_suggest_outlined,
      "items": [
        "improve platform performance",
        "Personalize user experience",
        "Provide better features",
        "Ensure security and prevent fraud",
      ],
    },
    {
      "num": "04",
      "title": "Data Sharing",
      "icon": Icons.share_outlined,
      "items": [
        "We do not sell your personal data",
        "We use trusted third-party services to operate and improve the platform.",
        "Data is shared only to improve platform functionality",
      ],
    },
    {
      "num": "05",
      "title": "Payments",
      "icon": Icons.payment_outlined,
      "items": [
        "We may use third-party payment services",
        "We do not store your payment details",
        "All payments are securely processed",
      ],
    },
    {
      "num": "06",
      "title": "Data Security",
      "icon": Icons.security_outlined,
      "items": [
        "We use secure methods to protect your data",
        "Your data is protected using standard security practices",
        "We continuously improve our security systems",
      ],
    },
    {
      "num": "07",
      "title": "Data Retention",
      "icon": Icons.timer_outlined,
      "items": [
        "We keep your data only as long as needed",
        "You can request data deletion anytime",
      ],
    },
    {
      "num": "08",
      "title": "Cookies & Tracking",
      "icon": Icons.cookie_outlined,
      "items": [
        "We may use cookies and analytics tools",
        "This helps improve user experience",
      ],
    },
    {
      "num": "09",
      "title": "Your Rights",
      "icon": Icons.gavel_outlined,
      "items": [
        "Access your data",
        "Request correction",
        "Request deletion",
        "Withdraw consent anytime",
      ],
    },
    {
      "num": "10",
      "title": "Contact Information",
      "icon": Icons.contact_support_outlined,
      "items": [
        "Developer: Sagar Borkar",
        "Email: sagarborkar0888@email.com",
        "Phone: +91 8788357452",
        "Location: India",
      ],
    },
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF090A0F) : const Color(0xFFF8FAFC);
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white70 : const Color(0xFF475569);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "Privacy Policy",
          style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 900),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Header Banner Icon & Title
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.privacy_tip_outlined,
                        color: Color(0xFF2563EB),
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "How we collect, use, and protect your information.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: subTextColor),
                    ),
                    const SizedBox(height: 24),

                    // LEGAL SECTION CARDS
                    for (int i = 0; i < _sections.length; i++) ...[
                      LegalSectionCard(
                        number: _sections[i]["num"] as String,
                        title: _sections[i]["title"] as String,
                        icon: _sections[i]["icon"] as IconData?,
                        items: List<String>.from(_sections[i]["items"] as List),
                      ),
                      const SizedBox(height: 16),
                    ],

                    const SizedBox(height: 12),

                    // Contact Us Button
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 320),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            UiHelper.launchUrlLink(
                              "https://wa.me/918788357452",
                            );
                          },
                          icon: const Icon(Icons.chat_bubble_outline, size: 18),
                          label: const Text(
                            "Contact Us",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2563EB),
                            foregroundColor: Colors.white,
                            elevation: 4,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Pinned Vertical Scroll Progress Bar (Right Edge)
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            child: ScrollProgressIndicator(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }
}
