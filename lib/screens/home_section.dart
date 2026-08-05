import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers/navigation_provider.dart';
import '../core/providers/theme_provider.dart';
import '../core/theme/app_theme.dart';
import '../helpers/ui_helper.dart';
import '../widgets/activity_gallery.dart';
import '../widgets/animated_stat_counter.dart';
import '../widgets/animated_typing_role.dart';
import '../widgets/back_to_top_button.dart';
import '../widgets/career_timeline.dart';
import '../widgets/responsive_navbar.dart';
import '../widgets/scroll_progress_indicator.dart';
import 'about_section.dart';
import 'contact_section.dart';
import 'pricing_section.dart';
import 'privacy_policy_screen.dart';
import 'projects_section.dart';
import 'services_screen.dart';
import 'skills_section.dart';
import 'terms_conditions_screen.dart';

class HomeSection extends ConsumerStatefulWidget {
  const HomeSection({super.key});

  @override
  ConsumerState<HomeSection> createState() => _HomeSectionState();
}

class _HomeSectionState extends ConsumerState<HomeSection> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _journeyKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(NavigationSection section) {
    GlobalKey targetKey;
    switch (section) {
      case NavigationSection.home:
        targetKey = _homeKey;
        break;
      case NavigationSection.about:
        targetKey = _aboutKey;
        break;
      case NavigationSection.skills:
        targetKey = _skillsKey;
        break;
      case NavigationSection.journey:
        targetKey = _journeyKey;
        break;
      case NavigationSection.projects:
        targetKey = _projectsKey;
        break;
      case NavigationSection.services:
        targetKey = _servicesKey;
        break;
      case NavigationSection.contact:
        targetKey = _contactKey;
        break;
    }

    final context = targetKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = ref.watch(themeModeProvider) == ThemeMode.dark;

    return Scaffold(
      appBar: ResponsiveNavbar(
        onSectionSelected: _scrollToSection,
        scrollController: _scrollController,
      ),
      endDrawer: _buildMenu(context, isDark),
      body: Container(
        decoration: BoxDecoration(
          gradient: isDark
              ? AppTheme.backgroundGradient
              : const LinearGradient(
                  colors: [
                    Color(0xFFF8FAFC),
                    Color(0xFFEFF6FF),
                    Color(0xFFF1F5F9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
        ),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // 🔥 HERO SECTION
                  Container(
                    key: _homeKey,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // Profile Image with Glow & Parallax
                        Container(
                          width: 135,
                          height: 135,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryBlue.withValues(
                                  alpha: 0.45,
                                ),
                                blurRadius: 30,
                                spreadRadius: 4,
                              ),
                              BoxShadow(
                                color: AppTheme.secondaryPurple.withValues(
                                  alpha: 0.3,
                                ),
                                blurRadius: 40,
                                spreadRadius: 8,
                              ),
                            ],
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/sagar_borkar_Sg.jpg',
                              width: 135,
                              height: 135,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: AppTheme.primaryBlue.withValues(
                                    alpha: 0.2,
                                  ),
                                  child: const Icon(
                                    Icons.person_rounded,
                                    size: 64,
                                    color: AppTheme.primaryBlue,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Greeting
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            'Hi, I am Sagar Borkar 👋',
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: isDark ? Colors.white : Colors.black87,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ),

                        const SizedBox(height: 16),

                        // Rotating Role Transition Widget
                        const RotatingRoleWidget(),

                        const SizedBox(height: 16),

                        // Subtitle Tagline
                        Text(
                          'Founder & Developer of SocialProX\nA cross-platform social media app',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            color: isDark ? Colors.white70 : Colors.black54,
                            height: 1.4,
                          ),
                        ),

                        const SizedBox(height: 30),

                        // CTA Buttons
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 450),
                          child: Column(
                            children: [
                              UiHelper.premiumButton(
                                text: "🌟 Journey & Achievements",
                                onTap: () {
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.journey;
                                  _scrollToSection(NavigationSection.journey);
                                },
                              ),
                              UiHelper.verticalSpace(10),
                              UiHelper.premiumButton(
                                text: "🚀 About Me",
                                onTap: () {
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.about;
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
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.projects;
                                  UiHelper.navigateWithSlideTransition(
                                    context,
                                    const ProjectsSection(),
                                  );
                                },
                              ),
                              UiHelper.verticalSpace(10),
                              UiHelper.premiumButton(
                                text: "💼 Pricing & Services",
                                onTap: () {
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.services;
                                  UiHelper.navigateWithSlideTransition(
                                    context,
                                    const PricingSection(),
                                  );
                                },
                              ),
                              UiHelper.verticalSpace(10),
                              UiHelper.premiumButton(
                                text: "⚡ What I Can Build",
                                onTap: () {
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.services;
                                  UiHelper.navigateWithSlideTransition(
                                    context,
                                    const ServicesScreen(),
                                  );
                                },
                              ),
                              UiHelper.verticalSpace(10),
                              UiHelper.premiumButton(
                                text: "📩 Contact Me",
                                onTap: () {
                                  ref
                                          .read(activeSectionProvider.notifier)
                                          .state =
                                      NavigationSection.contact;
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

                        // Quick Legal Links
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _miniButton(
                              context,
                              "🔐 Privacy",
                              const PrivacyPolicyScreen(),
                              isDark,
                            ),
                            UiHelper.horizontalSpace(10),
                            _miniButton(
                              context,
                              "📜 Terms",
                              const TermsConditionsScreen(),
                              isDark,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 50),

                  // 🔥 ABOUT SECTION SUMMARY
                  // 🔥 ABOUT SECTION SUMMARY
                  Container(
                    key: _aboutKey,
                    child: Column(
                      children: [
                        UiHelper.scrollAnimation(
                          child: _sectionCard(
                            "💡 About Me",
                            "Full Stack App Developer | UI/UX Enthusiast | Building SocialProX",
                            Icons.person,
                            isDark,
                          ),
                        ),
                        _sectionCard(
                          "🚀 My Mission",
                          "Creating apps that bring real impact and freedom.",
                          Icons.rocket_launch,
                          isDark,
                        ),
                      ],
                    ),
                  ),

                  // 🔥 CAREER TIMELINE SECTION
                  const CareerTimelineWidget(),

                  // 🔥 JOURNEY & ACHIEVEMENTS GALLERY SECTION
                  Container(
                    key: _journeyKey,
                    child: const ActivityGalleryWidget(),
                  ),

                  // 🔥 SERVICES / WHAT I DO SECTION SUMMARY
                  Container(
                    key: _servicesKey,
                    child: UiHelper.scrollAnimation(
                      child: _sectionCard(
                        "💼 What I Do",
                        "• Mobile App Development\n• UI Design\n• Cross-platform Apps",
                        Icons.work,
                        isDark,
                      ),
                    ),
                  ),

                  // 🔥 PROJECTS SECTION SUMMARY
                  Container(
                    key: _projectsKey,
                    child: Column(
                      children: [
                        _sectionCard(
                          "🔥 SocialProX",
                          "Built a social media app with chat, feed & media sharing",
                          Icons.verified,
                          isDark,
                        ),
                      ],
                    ),
                  ),

                  // 🔥 SKILLS & STATS SECTION SUMMARY
                  Container(
                    key: _skillsKey,
                    child: Column(
                      children: [
                        _sectionCard(
                          "🧠 Tech Stack",
                          "Flutter • Dart • Supabase • Cloudinary • REST APIs",
                          Icons.memory,
                          isDark,
                        ),
                        // Animated Stat Counter Grid
                        const AnimatedStatCounterGrid(),

                        _sectionCard(
                          "💬 Client Feedback",
                          "“Clean UI & smooth experience. Impressive work!”",
                          Icons.star,
                          isDark,
                        ),
                        _sectionCard(
                          "📈 Growth",
                          "Focused on building, improving, and scaling real apps",
                          Icons.trending_up,
                          isDark,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🔥 CONNECT / CONTACT SECTION SUMMARY
                  Container(
                    key: _contactKey,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "🌐 Connect With Me",
                          style: TextStyle(
                            color: isDark ? Colors.white : Colors.black87,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        UiHelper.scrollAnimation(
                          child: UiHelper.glowButton(
                            text: "🚀 Start Your Project",
                            onTap: () {
                              ref.read(activeSectionProvider.notifier).state =
                                  NavigationSection.contact;
                              UiHelper.navigateWithSlideTransition(
                                context,
                                const ContactSection(),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 25),
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
                                  "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%20in%20working%20with%20you.",
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
                        color: isDark ? Colors.white70 : Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  UiHelper.scrollAnimation(
                    child: Text(
                      "⏳ Response within 24 hours",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: isDark ? Colors.white54 : Colors.black45,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),

            // Vertical Glowing Scroll Progress Line along the left edge
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: ScrollProgressIndicator(
                scrollController: _scrollController,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Back To Top Floating Action Button
          BackToTopButton(scrollController: _scrollController),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "whatsapp",
            mini: true,
            backgroundColor: Colors.green,
            onPressed: () {
              UiHelper.launchUrlLink(
                "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%20in%20working%20with%20you.",
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
              UiHelper.launchUrlLink("https://github.com/sagarborkar0888-wq");
            },
            child: const Icon(Icons.code),
          ),
        ],
      ),
    );
  }

  Widget _miniButton(
    BuildContext context,
    String text,
    Widget page,
    bool isDark,
  ) {
    return GestureDetector(
      onTap: () {
        UiHelper.navigateWithSlideTransition(context, page);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppTheme.primaryBlue.withValues(alpha: 0.1),
          border: Border.all(
            color: AppTheme.primaryBlue.withValues(alpha: 0.25),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isDark ? Colors.white : Colors.black87,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _sectionCard(String title, String desc, IconData icon, bool isDark) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark
            ? AppTheme.darkSurface.withValues(alpha: 0.6)
            : Colors.white.withValues(alpha: 0.8),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppTheme.primaryBlue, size: 30),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isDark ? Colors.white : Colors.black87,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  desc,
                  style: TextStyle(
                    color: isDark ? Colors.white70 : Colors.black54,
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

  Widget _buildMenu(BuildContext context, bool isDark) {
    return Drawer(
      child: Container(
        color: isDark ? AppTheme.darkBackground : const Color(0xFFF8FAFC),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/images/sagar_borkar_Sg.jpg',
                        width: 36,
                        height: 36,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const CircleAvatar(
                            radius: 18,
                            child: Icon(Icons.person_rounded, size: 18),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Sagar Borkar",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            _menuItem(context, "Features", const ServicesScreen(), isDark),
            _menuItem(context, "Skills", const SkillsSection(), isDark),
            _menuItem(context, "Projects", const ProjectsSection(), isDark),
            _menuItem(context, "About Me", const AboutSection(), isDark),
            _menuItem(context, "Contact Us", const ContactSection(), isDark),
            _menuItem(context, "Pricing", const PricingSection(), isDark),
            const SizedBox(height: 20),
            Divider(color: isDark ? Colors.white24 : Colors.black12),
            const SizedBox(height: 10),
            _menuItem(
              context,
              "Privacy Policy 🔒",
              const PrivacyPolicyScreen(),
              isDark,
            ),
            _menuItem(
              context,
              "Terms & Conditions 📜",
              const TermsConditionsScreen(),
              isDark,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuItem(
    BuildContext context,
    String text,
    Widget page,
    bool isDark,
  ) {
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
          color: isDark
              ? Colors.white.withValues(alpha: 0.05)
              : Colors.black.withValues(alpha: 0.04),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            color: isDark ? Colors.white : Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
