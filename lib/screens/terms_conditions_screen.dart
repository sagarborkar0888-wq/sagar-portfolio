import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';
import '../widgets/legal/legal_section_card.dart';
import '../widgets/scroll_progress_indicator.dart';

class TermsConditionsScreen extends StatefulWidget {
  const TermsConditionsScreen({super.key});

  @override
  State<TermsConditionsScreen> createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  final ScrollController _scrollController = ScrollController();

  static const List<Map<String, dynamic>> _sections = [
    {
      "num": "01",
      "title": "About",
      "icon": Icons.info_outline,
      "items": [
        "This platform is owned and operated to provide professional app and website development services.",
        "This platform is created to provide services and solutions.",
        "By using this platform, you agree to follow all rules.",
        "We may update these terms at any time without prior notice.",
      ],
    },
    {
      "num": "02",
      "title": "User Responsibilities",
      "icon": Icons.verified_user_outlined,
      "items": [
        "Do not misuse the app.",
        "Do not try to hack or damage the system.",
        "Respect other users and content.",
      ],
    },
    {
      "num": "03",
      "title": "Privacy & Data",
      "icon": Icons.lock_outline,
      "items": [
        "We may collect basic usage data.",
        "Your data is used to improve the app.",
        "We do not sell your personal data.",
      ],
    },
    {
      "num": "04",
      "title": "Services",
      "icon": Icons.lightbulb_outline,
      "items": [
        "We provide app and website development services.",
        "Some features may require updates.",
        "Services may change or stop anytime.",
      ],
    },
    {
      "num": "05",
      "title": "Limitations",
      "icon": Icons.warning_amber_outlined,
      "items": [
        "We are not responsible for misuse.",
        "We are not liable for indirect damages.",
        "Use this platform at your own risk.",
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
          "Terms & Conditions",
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
                        Icons.gavel_rounded,
                        color: Color(0xFF2563EB),
                        size: 36,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Terms & Conditions",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: textColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Please review these terms before using this platform.",
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

                    // I Agree Button
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 320),
                      child: SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.check_circle_outline,
                            size: 18,
                          ),
                          label: const Text(
                            "I Agree",
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

                    const SizedBox(height: 28),

                    // Connect With Me Heading
                    Text(
                      "🌐 Connect With Me",
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Compact Social & Contact Action Chips
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        _socialChip(
                          text: "Instagram",
                          icon: Icons.camera_alt,
                          url:
                              "https://www.instagram.com/sagar_borkar_sg?igsh=bmM4cG9tbjh2ZGFm",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "LinkedIn",
                          icon: Icons.work,
                          url:
                              "https://www.linkedin.com/in/sagar-borkar-724ba7315",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "Facebook",
                          icon: Icons.facebook,
                          url: "https://www.facebook.com/share/1KDS9vSibg/",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "GitHub",
                          icon: Icons.code,
                          url: "https://github.com/sagarborkar0888-wq",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "WhatsApp",
                          icon: Icons.chat,
                          url:
                              "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Features%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you.",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "Email",
                          icon: Icons.email,
                          url: "mailto:sagarborkar0888@email.com",
                          isDark: isDark,
                        ),
                        _socialChip(
                          text: "Call",
                          icon: Icons.call,
                          url: "tel:+918788357452",
                          isDark: isDark,
                        ),
                      ],
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

  // Compact Social Chip Widget for Terms & Conditions Screen
  Widget _socialChip({
    required String text,
    required IconData icon,
    required String url,
    required bool isDark,
  }) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);

    return InkWell(
      onTap: () => UiHelper.launchUrlLink(url),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: const Color(0xFF2563EB), size: 14),
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
