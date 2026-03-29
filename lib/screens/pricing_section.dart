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

                _title("💎 Custom App Pricing"),

                _section([
                  const Text(
                    "Custom App (Based on Requirements)\n\n"
                        "💰 Starting from ₹20,000 (Starting)\n\n"
                        "Final pricing depends on features, complexity, and scalability requirements.\n\n"
                        "Let’s discuss your project to provide an accurate estimate.",
                  ),
                ]),

                _title("📱 App Development Pricing"),

                UiHelper.scrollAnimation(
                  child: _section([
                    const Text(
                      "💰 Real-World Pricing\n\n"

                          "📱 Basic App: ₹10,000 – ₹25,000 (\$120 – \$300)\n"
                          "• Clean UI\n"
                          "• Core features\n\n"

                          "📱 Standard App (Recommended): ₹25,000 – ₹60,000 (\$300 – \$750)\n"
                          "• User Authentication (Login/Signup)\n"
                          "• API & database integration\n\n"

                          "📱 Advanced App: ₹60,000 – ₹1,50,000+ (\$750 – \$1800+)\n"
                          "• Full-featured app\n"
                          "• Scalable architecture\n"
                          "• Premium UI/UX\n"
                          "• Advanced App customers usually choose Premium Support for smooth launch\n\n"
                          "• ⚠ Note: iOS app is not included in any package. Delivery is Android APK/AAB only.\n"
                          "• ⚠ AI-powered backend features are not included in any package.\n\n"

                          "⚡ Each app is built based on your requirements.\n\n"
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
                          "₹20,000 – ₹40,000 (\$240 – \$500)\n\n"

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

                _title("📊 Tech Stack"),
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
    Text("• Full Stack App Development"),
    Text("• Mobile App UI/UX Design"),
    Text("• Backend Integration (APIs, Database)"),
    Text("• Performance Optimization"),
    Text("• App Deployment & Launch"),
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
    Text("• Bug Free Setup"),
  ];

  /// ⚖️ COMPARISON
  Widget _comparisonTable() {
    return Column(
      children: [
        _row("Feature", "Basic", "Premium"),
        _row("UI Screens", "2", "Unlimited"),
        _row("API", "❌", "✅"),
        _row("Support", "❌", "✅"),
      ],
    );
  }

  Widget _row(String a, String b, String c) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(child: Text(a)),
          Expanded(child: Text(b, textAlign: TextAlign.center)),
          Expanded(child: Text(c, textAlign: TextAlign.right)),
        ],
      ),
    );
  }

  List<Widget> _delivery() => const [
    Text("• Basic: 2–4 Days"),
    Text("• Standard: 5–10 Days"),
    Text("• Advanced: 10–20 Days"),
    Text("• Delivery time may vary depending on project requirements."),
  ];

  List<Widget> _revisions() => const [
    Text("• Basic: 1 Revision"),
    Text("• Standard: 2 Revisions"),
    Text("• Premium: 3–5 Minor Revisions"),
  ];

  List<Widget> _support() => const [
    Text("• Basic: No Support – Just app delivery"),
    Text("• Standard: 7 Days – Minor bug fixes after launch"),
    Text("• Premium: 30 Days – Full launch support + minor updates (recommended for Advanced Apps)"),
    Text("• Optional: Monthly Support – Ongoing updates & maintenance (₹5k–10k/month)"),
  ];

  List<Widget> _payment() => const [
    Text("• 50% Advance"),
    Text("• UPI / Bank Transfer"),
    Text("• Payment details will be discussed"),
    Text("• Payments are non-refundable once development begins"),
  ];

  List<Widget> _techStack() => const [
    Text("• Flutter"),
    Text("• Firebase"),
    Text("• REST APIs"),
    Text("• Cloud Storage"),
  ];

  List<Widget> _notIncluded() => const [
    Text("• Hosting Cost"),
    Text("• App Store Fees"),
    Text("• Third-party APIs"),
  ];

  List<Widget> _testimonials() => const [
    Text("⭐ Clean UI & smooth performance"),
    Text("⭐ Professional and reliable developer"),
  ];
}