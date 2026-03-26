import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    super.dispose();
  }

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      if (!mounted) return;
      UiHelper.showSnackbar(context, "Could not open link");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Contact",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// 🔥 HEADER (Premium Gradient Card)
            /// 🔥 IMAGE
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.3),
                    blurRadius: 20,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  'assets/images/sagar_borkar_1.jpeg',
                ),
              ),
            ),

            UiHelper.verticalSpace(15),

            const Text(
              "Let’s Work Together 🚀",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              "Turning ideas into powerful digital experiences.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),
            UiHelper.verticalSpace(20),

            /// 🔥 WHAT I OFFER
            UiHelper.sectionCard(
              title: "💼 Services I Offer",
              items: [
                "Full Stack App Development",
                "Modern UI/UX Design",
                "Backend Integration (Supabase, APIs)",
                "Performance Optimization & Bug Fixing",
                "Play Store Deployment",
              ],
            ),

            UiHelper.verticalSpace(20),

            /// 🔥 PROJECT INFO
            UiHelper.sectionCard(
              title: "🚀 Featured Project",
              highlight: true, // 🔥 makes it stand out
              items: [
                "SocialProX – A social media platform",
                "Features: Posts, Likes, Comments, Chat",
                "Tech: Flutter + Supabase + Cloudinary",
              ],
            ),
            UiHelper.verticalSpace(20),

            UiHelper.sectionCard(
              title: "⏳ Work Availability",
              highlight: true,
              items: [
                "Available for freelance & collaboration",
                "Selective projects (quality focus)",
                "Open to startup ideas & partnerships",
              ],
            ),

            UiHelper.verticalSpace(20),

            UiHelper.verticalSpace(20),

            /// 🔥 QUICK ACTIONS (Premium Chips)
            /// 🔥 CONTACT INFO CARD

            UiHelper.sectionCard(
              title: "📍 Contact Info",
              items: [
                "📧 Email: sagarborkar0888@email.com",
                "📱 Phone: +91 8788357452",
                "🌍 Location: India",
              ],
            ),
            UiHelper.verticalSpace(15),

            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                UiHelper.chipButton(
                  text: "Instagram",
                  onTap: () => _launch(
                    "https://www.instagram.com/sagar_borkar_sg?igsh=bmM4cG9tbjh2ZGFm",
                  ),
                ),

                UiHelper.chipButton(
                  text: "LinkedIn",
                  onTap: () => _launch(
                    "https://www.linkedin.com/in/sagar-borkar-724ba7315?utm_source=sha"
                    "re&utm_campaign=share_via&utm_content=profile&utm_medium=android_app",
                  ),
                ),

                UiHelper.chipButton(
                  text: "Facebook",
                  onTap: () =>
                      _launch("https://www.facebook.com/share/1KDS9vSibg/"),
                ),
              ],
            ),

            UiHelper.verticalSpace(20),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                UiHelper.chipButton(
                  text: "Email",
                  onTap: () => _launch("mailto:sagarborkar0888@email.com"),
                ),

                UiHelper.chipButton(
                  text: "Call",
                  onTap: () => _launch("tel:+918788357452"),
                ),

                UiHelper.chipButton(
                  text: "GitHub",
                  onTap: () => _launch(
                    "https://github.com/sagarborkar0888-wq",
                  ),
                ),
              ],
            ),

            UiHelper.verticalSpace(30),

            /// 🔥 FORM CARD (Glass effect)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white24),
              ),
              child: Column(
                children: [
                  UiHelper.customTextField(
                    nameController,
                    "Your Name",
                    Icons.person,
                    false,
                  ),

                  UiHelper.customTextField(
                    emailController,
                    "Your Email",
                    Icons.email,
                    false,
                  ),

                  /// MESSAGE FIELD
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: TextField(
                      controller: messageController,
                      maxLines: 5,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Your Message",
                        hintStyle: const TextStyle(color: Colors.white70),
                        filled: true,
                        fillColor: Colors.white10,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),

                  UiHelper.verticalSpace(20),

                  /// 🔥 TRUST NOTE
                  const Text(
                    "⚡ build scalable, production-ready apps.\n"
                    "💎 Focused on quality, performance & user experience.",
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),

                  UiHelper.verticalSpace(15),

                  /// 🔥 PREMIUM BUTTON
                  UiHelper.glowButton(
                    text: "Start Project on Whatsapp 🚀",
                    onTap: () {
                      if (nameController.text.isEmpty ||
                          emailController.text.isEmpty ||
                          messageController.text.isEmpty) {
                        UiHelper.showSnackbar(
                          context,
                          'Please fill all fields',
                        );
                        return;
                      }

                      final message =
                          """
👋 *New Project Inquiry*

👤 Name: ${nameController.text}
📧 Email: ${emailController.text}

💬 Message:
${messageController.text}

---
Sent from Portfolio App 🚀
""";

                      final url =
                          "https://wa.me/918788357452?text=${Uri.encodeComponent(message)}";

                      _launch(url);
                    },
                  ),
                ],
              ),
            ),

            UiHelper.verticalSpace(30),

            /// 🔥 WORK INFO
            UiHelper.sectionCard(
              title: "⏳ Project Workflow",
              items: [
                "Response time: Within 24 hours",
                "Working hours: Flexible",
                "Limited projects for maximum quality",
              ],
            ),
            UiHelper.verticalSpace(15),

            UiHelper.sectionCard(
              title: "⚡ Response Time",
              items: [
                "I reply within 24 hours",
                "Priority support for active projects",
              ],
            ),

            UiHelper.verticalSpace(20),

            UiHelper.premiumButton(
              text: "🔥 Start a Project",
              onTap: () {
                _launch(
                  "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%"
                      "20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Featur"
                      "es%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20"
                      "or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you.",
                );
              },
            ),

            UiHelper.verticalSpace(10),

            UiHelper.premiumButton(
              text: " Let’s Talk 💬",
              onTap: () {
                _launch(
                  "https://wa.me/918788357452?text=Hi%20Sagar%20👋%0A%0AI%20came%20across%20your%20portfolio%20and%20I%E2%80%99d%20like%20to%20connect%20with%20you."
                      "%0A%0AI%20have%20a%20small%20idea%20and%20wanted%20to%20discuss%20it%20with%20you.%0A%0ACan%20we%20chat%3F%20😊",
                );
              },
            ),

            const SizedBox(height: 30),

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

            const SizedBox(height: 30),

            /// 🔥 FOOTER
            const Center(
              child: Text(
                "Response within 24 hours ⏳",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
