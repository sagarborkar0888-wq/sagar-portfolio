import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';

class TermsConditionsScreen extends StatelessWidget {
  const TermsConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Terms & Conditions",
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [

                UiHelper.scrollAnimation(
                  child: UiHelper.sectionCard(
                    title: "📌 About",
                    items: [
                      "This platform is owned and operated to provide professional app and website development services.",
                      "This platform is created to provide services and solutions.",
                      "By using this platform, you agree to follow all rules.",
                      "We may update these terms at any time without prior notice.",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                UiHelper.scrollAnimation(
                  child: UiHelper.sectionCard(
                    title: "⚡ User Responsibilities",
                    highlight: true,
                    items: [
                      "Do not misuse the app.",
                      "Do not try to hack or damage the system.",
                      "Respect other users and content.",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                UiHelper.scrollAnimation(
                  child: UiHelper.sectionCard(
                    title: "🔒 Privacy & Data",
                    items: [
                      "We may collect basic usage data.",
                      "Your data is used to improve the app.",
                      "We do not sell your personal data.",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                UiHelper.scrollAnimation(
                  child: UiHelper.sectionCard(
                    title: "💡 Services",
                    highlight: true,
                    items: [
                      "We provide app and website development services.",
                      "Some features may require updates.",
                      "Services may change or stop anytime.",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                UiHelper.scrollAnimation(
                  child: UiHelper.sectionCard(
                    title: "⚠️ Limitations",
                    items: [
                      "We are not responsible for misuse.",
                      "We are not liable for indirect damages.",
                      "Use this platform at your own risk.",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(20),

                UiHelper.scrollAnimation(
                  child: UiHelper.glowButton(
                    text: "I Agree",
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                UiHelper.verticalSpace(20),

                const Text(
                  "🌐 Connect With Me",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                UiHelper.verticalSpace(20),

                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    UiHelper.socialButton(
                      text: "Instagram",
                      icon: Icons.camera_alt,
                      url:
                      "https://www.instagram.com/sagar_borkar_sg?igsh=bmM4cG9tbjh2ZGFm",
                    ),

                    UiHelper.socialButton(
                      text: "LinkedIn",
                      icon: Icons.work,
                      url:
                      "https://www.linkedin.com/in/sagar-borkar-724ba7315",
                    ),

                    UiHelper.socialButton(
                      text: "Facebook",
                      icon: Icons.facebook,
                      url: "https://www.facebook.com/share/1KDS9vSibg/",
                    ),

                    UiHelper.socialButton(
                      text: "GitHub",
                      icon: Icons.code,
                      url: "https://github.com/sagarborkar0888-wq",
                    ),

                    UiHelper.socialButton(
                      text: "WhatsApp",
                      icon: Icons.chat,
                      url:
                      "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%"
                          "20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Featur"
                          "es%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20"
                          "or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you.",
                    ),

                    UiHelper.socialButton(
                      text: "Email",
                      icon: Icons.email,
                      url: "mailto:sagarborkar0888@email.com",
                    ),

                    UiHelper.socialButton(
                      text: "Call",
                      icon: Icons.call,
                      url: "tel:+918788357452",
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Optional premium vertical line
          UiHelper.verticalLine(left: 20),
        ],
      ),
    );
  }
}