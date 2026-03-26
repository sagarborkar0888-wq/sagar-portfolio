import 'package:flutter/material.dart';
import 'package:sagar_borkar_tech/screens/pricing_section.dart';
import 'package:sagar_borkar_tech/screens/privacy_policy_screen.dart';
import 'package:sagar_borkar_tech/screens/services_screen.dart';
import 'package:sagar_borkar_tech/screens/terms_conditions_screen.dart';
import '../helpers/ui_helper.dart';
import 'about_section.dart';
import 'projects_section.dart';
import 'skills_section.dart';
import 'contact_section.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sagar Portfolio"),
        actions: [
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),

      endDrawer: _buildMenu(context), // 🔥 ADD THIS

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0F0F0F), Color(0xFF1A1A1A), Color(0xFF000000)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 60),

              // 🔥 PROFILE IMAGE
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 25,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/sagar_borkar.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 NAME
              Text(
                  'Hi, I am Sagar 👋',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                ),

              const SizedBox(height: 10),

              // 🔥 ROLE (IMPORTANT)
             Text(
                  'Application Developer / Android Developer         Full Stack App Developer',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDark ? Colors.white70 : Colors.black54,
                  ),
                ),

              const SizedBox(height: 6),

              // 🔥 TAGLINE
                Text(
                  'Founder & Developer of SocialProX\nA cross-platform social media app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDark ? Colors.white60 : Colors.black45,
                  ),
                ),

              const SizedBox(height: 25),

              // 🔥 MAIN BUTTONS
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    UiHelper.premiumButton(
                        text: "🚀 About me",
                        onTap: () {
                          UiHelper.navigateWithSlideTransition(
                            context,
                            const AboutSection(),
                          );
                        },
                      ),

                    UiHelper.verticalSpace(10),

                    UiHelper.premiumButton(
                        text: "🚀 View Projects",
                        onTap: () {
                          UiHelper.navigateWithSlideTransition(
                            context,
                            const ProjectsSection(),
                          );
                        },
                      ),

                    UiHelper.verticalSpace(10),
                    UiHelper.premiumButton(
                        text: "🚀 Pricing & Services 💼",
                        onTap: () {
                          UiHelper.navigateWithSlideTransition(
                            context,
                            const PricingSection(),
                          );
                        },
                      ),

                    UiHelper.verticalSpace(10),

                      UiHelper.premiumButton(
                        text: "🚀 What I Can Build 🚀",
                        onTap: () {
                          UiHelper.navigateWithSlideTransition(
                            context,
                            const ServicesScreen(),
                          );
                        },
                      ),

                    UiHelper.verticalSpace(10),

                     UiHelper.premiumButton(
                        text: "🚀 Contact Me",
                        onTap: () {
                          UiHelper.navigateWithSlideTransition(
                            context,
                            const ContactSection(),
                          );
                        },
                      ),
                  ],
                ),
              ),

              const SizedBox(height: 25),

              // 🔥 QUICK NAVIGATION (SMALL)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _miniButton(context, "🔐 Privacy", const PrivacyPolicyScreen()),
                  UiHelper.horizontalSpace(10),
                  _miniButton(context, "📜 Terms", const TermsConditionsScreen()),
                ],
              ),

              const SizedBox(height: 40),

// 🔥 PREMIUM SECTIONS (ADD THIS)
              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "💡 About Me",
                  "Full Stack App Developer | UI/UX Enthusiast | Building SocialProX",
                  Icons.person,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "🚀 My Mission",
                  "Creating apps that bring real impact and freedom.",
                  Icons.rocket_launch,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "💼 What I Do",
                  "• Mobile App Development\n• UI Design\n• Cross-platform Apps",
                  Icons.work,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "🔥 SocialProX",
                  "Built a social media app with chat, feed & media sharing",
                  Icons.verified,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "🧠 Tech Stack",
                  "Flutter • Dart • Supabase • Cloudinary • REST APIs",
                  Icons.memory,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "📊 Stats",
                  "🚀 1 Social App Built\n📱 20+ Screens Designed\n🔥 Real Features (Chat, Feed, Upload)",
                  Icons.bar_chart,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "💬 Client Feedback",
                  "“Clean UI & smooth experience. Impressive work!”",
                  Icons.star,
                ),
              ),

              UiHelper.scrollAnimation(
                child: _sectionCard(
                  "📈 Growth",
                  "Focused on building, improving, and scaling real apps",
                  Icons.trending_up,
                ),
              ),

              const SizedBox(height: 30),

              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "🌐 Connect With Me",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: UiHelper.scrollAnimation(
                        child: UiHelper.glowButton(
                          text: "🚀 Start Your Project",
                          onTap: () {
                            UiHelper.navigateWithSlideTransition(
                              context,
                              const ContactSection(),
                            );
                          },
                        ),
                      ),
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
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 🔥 FOOTER
              UiHelper.scrollAnimation(
                child: Text(
                  "🚀 Available for freelance & collaborations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              SizedBox(height: 5),

              UiHelper.scrollAnimation(
                child: Text(
                  "⏳ Response within 24 hours",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white54),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          FloatingActionButton(
            heroTag: "whatsapp",
            mini: true,
            backgroundColor: Colors.green,
            onPressed: () {
              // WhatsApp link
              UiHelper.launchUrlLink(
                  "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%"
                      "20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Featur"
                      "es%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20"
                      "or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you."
              );
            },
            child: const Icon(Icons.chat),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: "github",
            mini: true,
            backgroundColor: Colors.red,
            onPressed: () {
              // GitHub link
              UiHelper.launchUrlLink("https://github.com/sagarborkar0888-wq");
            },
            child: const Icon(Icons.code),
          ),
        ],
      ),
    );
  }

  // 🔥 MINI BUTTON
  Widget _miniButton(BuildContext context, String text, Widget page) {
    return GestureDetector(
      onTap: () {
        UiHelper.navigateWithSlideTransition(context, page);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(0.1),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _sectionCard(String title, String desc, IconData icon) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Colors.white.withOpacity(0.08),
            Colors.white.withOpacity(0.03),
          ],
        ),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  desc,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔥 HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UiHelper.glowAvatarAsset(
                      imagePath: 'assets/images/sagar_borkar.jpg',
                      radius: 18,
                    ),
                    const SizedBox(width: 10),
                    UiHelper.scrollAnimation(
                      child: const Text(
                        "Sagar Developer",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            // 🔥 MENU ITEMS
            _menuItem(context, "Features", const ServicesScreen()),
            _menuItem(context, "Skills", const SkillsSection()),
            _menuItem(context, "Student Wins", const ProjectsSection()),
            _menuItem(context, "About Me", const AboutSection()),
            _menuItem(context, "Contact Us", const ContactSection()),
            _menuItem(context, "Pricing", const PricingSection()),

            const SizedBox(height: 20),

            const Divider(color: Colors.white24),

            const SizedBox(height: 10),

            // 🔥 EXTRA (LIKE YOUR IMAGE)
            _menuItem(context, "Privacy Policy 🔒", const PrivacyPolicyScreen()),
            _menuItem(context, "Terms & Conditions 📜", const TermsConditionsScreen()),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String text, Widget page) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
        UiHelper.navigateWithSlideTransition(context, page);
      },
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
        margin: const EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.05),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

