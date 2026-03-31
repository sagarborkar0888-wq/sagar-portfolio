import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';

class PricingSection extends StatelessWidget {
  const PricingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title: const Text("Pricing & Services 💼"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),

      body: Stack(
        children: [
          UiHelper.verticalLine(left: 30),

          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _title("💼 Services Offered"),
                 _section(_services()),

                _title("🧠 How Pricing Works"),

                _section([
                  const Text(
                    "Every app is different. Pricing depends on:\n\n"
                        "• Number of screens\n"
                        "• Features & integrations\n"
                        "• App complexity\n"
                        "• Timeline requirements\n\n"
                        "The packages below are real-world estimates based on typical client projects.\n"
                        "Final quote is shared after understanding your project requirements.",
                  ),
                ]),

                _title("📱 App Development Pricing"),

              UiHelper.scrollAnimation(
                child: _section([
                  const Text(
                    "💰 Real-World Pricing\n\n"
                        "⚠ Price depends on number of screens, features, and complexity. Final quote will be shared after project discussion.\n"
                        "⚠ Any external costs, deployment fees, or optional services are not included in the base price.\n\n"

                        "📱 Basic App: ₹10,000 – ₹25,000 (\$120 – \$300)\n"
                        "• Clean UI\n"
                        "• Core features\n"
                        "• Screens: 2–5\n\n"

                        "📱 Standard App (Recommended): ₹25,000 – ₹60,000 (\$300 – \$750)\n"
                        "• User Authentication (Login/Signup)\n"
                        "• API & database integration\n"
                        "• Screens: 6–15\n\n"

                        "📱 Advanced App: ₹60,000 – ₹1,50,000+ (\$750 – \$1800+)\n"
                        "• Full-featured app\n"
                        "• Scalable architecture\n"
                        "• Premium UI/UX\n"
                        "• Screens: 16–30+\n\n"

                        "⚙ Delivery & Add-ons\n"
                        "• Android app build (APK/AAB) included in all packages\n"
                        "• Google Play Store deployment available as a paid add-on service\n"
                        "• Client provides Play Store developer account for publishing\n"
                        "• iOS app development is not available currently\n"
                        "• Ongoing support & maintenance available after delivery\n\n"

                        "⚡ Each app is built based on your requirements.\n\n"

                        "⚠ “Unlimited” refers to screens/features within the agreed project scope. Additional feature requests may require extra fees.\n\n"

                        "👉 Final pricing depends on features and scope.\n"
                        "Let’s discuss your idea for an exact estimate.",
                  ),
                ]),
              ),

                _title("⚙️ Admin Panel (Optional Add-on)"),

                UiHelper.scrollAnimation(
                  child: _section([
                    const Text(
                    "👉 Helps you manage your app easily without technical knowledge.\n\n"
                      "💻 Admin Dashboard (Web Platform)\n"
                          "₹25,000 – ₹60,000 (\$300 – \$750)\n\n"

                          "Includes:\n"
                          "• Admin login\n"
                          "• User management\n"
                          "• Content management\n"
                          "• Data control\n"
                          "• Analytics dashboard\n\n"

                          "👉 Optional and not included in base app.\n"
                          "👉 Required only if client needs control panel.",
                    ),
                  ]),
                ),

                _title("📦 What You Get"),
                UiHelper.scrollAnimation(child: _section(_included())),

                _title("⚖️ Package Comparison"),
                UiHelper.scrollAnimation(
                  child: _section([
                    _comparisonTable(),
                  ]),
                ),

                _title("⏱ Delivery Time"),
                UiHelper.scrollAnimation(child: _section(_delivery())),

                _title("🔄 Revisions"),
                UiHelper.scrollAnimation(child: _section(_revisions())),

                _title("🧑‍💻 Support & Maintenance"),
                UiHelper.scrollAnimation(child: _section(_support())),

                _title("💳 Payment Terms"),
                UiHelper.scrollAnimation(child: _section(_payment())),

                _title("📊 Development Approach"),
                UiHelper.scrollAnimation(
                  child: _section([
                    const Text(
                      "🚀 I follow an MVP (Minimum Viable Product) approach.\n\n"
                          "✔ Phase 1: Core features for initial launch\n"
                          "✔ After delivery: Review & feedback\n\n"
                          "💼 Phase 2 (Optional): Advanced features such as:\n"
                          "• Payment systems\n"
                          "• Advanced UI/UX enhancements\n"
                          "• Performance scaling\n"
                          "• Admin panel & analytics\n\n"
                          "📌 These are handled separately to maintain quality and focus.",
                    ),
                  ]),
                ),

                _title("🛠 Tech Stack"),
                UiHelper.scrollAnimation(child: _section(_techStack())),

                _title("🚫 Not Included"),
                UiHelper.scrollAnimation(child: _section(_notIncluded())),

                _title("💬 Client Feedback (Coming Soon)"),
                UiHelper.scrollAnimation(child: _section(_testimonials())),

                UiHelper.verticalSpace(30),

                UiHelper.glowButton(
                  text: "Chat on WhatsApp 💬",
                  onTap: () {
                    final message = """
👋 Hi Sagar,

I would like to get in touch with you regarding your services.

Looking forward to your response.

Thank you.
""";

                    final url =
                        "https://wa.me/918788357452?text=${Uri.encodeComponent(message)}";

                    UiHelper.launchUrlLink(url);
                  },
                ),

                UiHelper.verticalSpace(20),

              UiHelper.iconButton(
                text: "Start Project on WhatsApp",
                icon: Icons.rocket_launch,
                onTap: () {
                    final message = """
🚀 *Project Inquiry*

👋 Hi Sagar,

I want to start a project with you.

📝 Project Details:
- Project Type: 
- Features Required: 
- Budget: 
- Timeline: 

💡 Additional Information:
(Describe your idea here)

Looking forward to working with you.

Thank you.
""";

                    final url =
                        "https://wa.me/918788357452?text=${Uri.encodeComponent(message)}";
                    UiHelper.launchUrlLink(url);
                  },
                ),

                SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 🔥 TITLE
  Widget _title(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 10),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  /// 🔥 SECTION BOX
  Widget _section(List<Widget> children) {
    return UiHelper.animatedCard(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }

  /// 🔥 SERVICES
  List<Widget> _services() => const [
    Text("• Cross-platform Mobile App Development"),
    Text("• Mobile App UI/UX Design"),
    Text("• Backend Integration (APIs & Database)"),
    Text("• App Performance Optimization"),
    Text("• Android App Delivery (Signed APK/AAB)"),
    Text("• Google Play Store Deployment (optional paid add-on)"),
  ];

  /// 🔥 PRICING CARD
  Widget _pricingCard(String title, String price) {
    return UiHelper.animatedCard(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(price,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.4)),
          ],
        ),
      ),
    );
  }

  /// 📦 INCLUDED
  List<Widget> _included() => const [
    Text("• Modern UI Design"),
    Text("• Responsive Design"),
    Text("• Source Code"),
    Text("• Stable production-ready setup"),
    Text("• Signed APK/AAB ready for client use"),
  ];

  /// ⚖️ COMPARISON
  Widget _comparisonTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _row("Feature", "Basic", "Standard", "Advanced"),
        _row("UI Screens", "2–5", "6–15", "16+"),
        _row("UI/UX Quality", "Basic", "Improved", "Premium"),
        _row("Authentication", "❌", "✅", "✅"),
        _row("API Integration", "❌", "✅", "✅"),
        _row("Database", "❌", "✅", "✅"),
        _row("Architecture", "Basic", "Standard", "Scalable"),
        _row("Launch Support", "❌", "Limited", "Priority"),
        const SizedBox(height: 10),
        const Text(
          "⚠ “Unlimited” refers to all screens/features within the agreed project scope. "
              "Extra requests beyond scope can be discussed and may require additional fees.",
          style: TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }

  Widget _row(String feature, String basic, String standard, String advanced) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(flex: 2, child: Text(feature)),
          Expanded(child: Text(basic, textAlign: TextAlign.center)),
          Expanded(child: Text(standard, textAlign: TextAlign.center)),
          Expanded(child: Text(advanced, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  List<Widget> _delivery() => const [
    Text("• Basic: 5–10 Days"),
    Text("• Standard: 10–18 Days"),
    Text("• Advanced: 3–5 Weeks"),
    Text("• Delivery time may vary depending on project requirements."),
  ];

  List<Widget> _revisions() => const [
    Text("• Basic: 1 revision"),
    Text("• Standard: 2 revisions"),
    Text("• Advanced: Up to 5 minor design/feature revisions"),
  ];

  List<Widget> _support() => const [
    Text("• Basic: App delivery only"),
    Text("• Standard: 7 days post-delivery minor bug fixes"),
    Text("• Advanced: 30 days post-launch support + minor updates"),
    Text("• Optional: Monthly maintenance plan available"),
  ];

  List<Widget> _payment() => const [
    Text("• 50% advance to start the project"),
    Text("• Remaining 50% before final delivery"),
    Text("• UPI / Bank Transfer accepted"),
    Text("• Milestone payments available for large projects"),
    Text("• Payments are for the work completed and time reserved for your project"),
  ];

  List<Widget> _techStack() => const [
    Text("• Cross-platform mobile app development"),
    Text("• Backend integration & APIs"),
    Text("• Cloud database & storage"),
    Text("• Secure authentication systems"),
    Text("• Scalable app architecture"),
  ];

  List<Widget> _notIncluded() => const [
    Text("⚠ Any external costs, deployment fees, or optional features are not included in the base price.\n"),
    Text("• Play Store Developer Account (required if deploying Android app)"),
    Text("• iOS app build & App Store deployment"),
    Text("• Hosting Costs (if any server is used)"),
    Text("• Third-party APIs or paid services"),
    Text("• AI-powered backend features"),
  ];

  List<Widget> _testimonials() => const [
    Text("⭐ Clean UI & smooth performance"),
    Text("⭐ Professional & reliable development experience"),
  ];
}