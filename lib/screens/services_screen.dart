import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';
import 'contact_section.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text("What I Can Build 🚀", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// 🔥 PREMIUM HEADER
            UiHelper.fadeSlideSection(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "What I Can Build 🚀",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "I build scalable, high-performance digital products.",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 SERVICES (Glass Cards)
            _premiumService(
              Icons.phone_android,
              "App Development",
              "High-performance mobile and web applications built for scale.",
            ),

            _premiumService(
              Icons.design_services,
              "UI/UX Design",
              "Modern, intuitive and conversion-focused user interfaces.",
            ),

            _premiumService(
              Icons.bug_report,
              "Optimization & Maintenance",
              "Improve performance, fix issues, and ensure smooth user experience.",
            ),

            _premiumService(
              Icons.rocket_launch,
              "Launch & Deployment",
              "Complete app setup, optimization, and store deployment.",
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 WHY ME (Glass)
            _glassSection(
              title: "Why Work With Me",
              children: const [
                "⚡ Fast & reliable delivery",
                "🧠 Clean and scalable architecture",
                "🚀 Real-world project experience",
                "🎯 Focus on quality and performance",
              ],
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 PROCESS
            _glassSection(
              title: "Work Process",
              children: const [
                "1. Requirement discussion",
                "2. UI/UX planning",
                "3. Development & testing",
                "4. Deployment & support",
              ],
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 SKILLS TAGS
            _glassSection(
              title: "Capabilities",
              isWrap: true,
              wrapItems: const [
                "Cross-platform apps",
                "Backend systems",
                "API integrations",
                "Cloud storage",
                "Scalable architecture",
                "UI/UX design",
              ],
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 STATS
            _glassSection(
              title: "My Skills",
              childrenWidgets: [
                _stat("App Development", 0.85),
                _stat("UI Design", 0.80),
                _stat("Backend", 0.75),
              ],
            ),

            UiHelper.verticalSpace(30),

            /// 🔥 CTA
            UiHelper.glowButton(
              text: "Start Project on WhatsApp 🚀",
              onTap: () {
                // WhatsApp link
                UiHelper.launchUrlLink(
                    "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%"
                        "20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Featur"
                        "es%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20"
                        "or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you."
                );
              },
            ),

            UiHelper.verticalSpace(10),

            UiHelper.glowButton(
              text: "Get in Touch ✉️",
              onTap: () {
                UiHelper.navigateWithSlideTransition(context, ContactSection());
              },
            ),

            UiHelper.verticalSpace(20),

            const Center(
              child: Text(
                "Limited projects accepted ⚡",
                style: TextStyle(color: Colors.grey),
              ),
            ),

            UiHelper.verticalSpace(30),
          ],
        ),
      ),
    );
  }

  /// 🔥 PREMIUM SERVICE CARD
  Widget _premiumService(IconData icon, String title, String desc) {
    return UiHelper.fadeSlideSection(
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.withOpacity(0.2),
              child: Icon(icon, color: Colors.white),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    desc,
                    style: const TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// 🔥 GLASS SECTION (Reusable)
  Widget _glassSection({
    required String title,
    List<String>? children,
    List<Widget>? childrenWidgets,
    List<String>? wrapItems,
    bool isWrap = false,
  }) {
    return UiHelper.fadeSlideSection(
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.white24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),

            UiHelper.verticalSpace(10),

            if (children != null)
              ...children.map((e) => Text("• $e",
                  style: const TextStyle(color: Colors.white70))),

            if (childrenWidgets != null) ...childrenWidgets,

            if (isWrap && wrapItems != null)
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: wrapItems
                    .map((e) => UiHelper.chipButton(text: e, onTap: () {}))
                    .toList(),
              ),
          ],
        ),
      ),
    );
  }

  /// 🔥 PROGRESS BAR
  Widget _stat(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        UiHelper.verticalSpace(5),
        UiHelper.animatedProgressBar(percent: value),
        UiHelper.verticalSpace(10),
      ],
    );
  }
}