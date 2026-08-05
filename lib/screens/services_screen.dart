import 'package:flutter/material.dart';
import '../widgets/scroll_progress_indicator.dart';
import '../widgets/services/capability_chips.dart';
import '../widgets/services/service_card.dart';
import '../widgets/services/service_cta.dart';
import '../widgets/services/service_hero.dart';
import '../widgets/services/skill_proficiency.dart';
import '../widgets/services/why_work_with_me.dart';
import '../widgets/services/work_process_card.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({super.key});

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  final ScrollController _scrollController = ScrollController();

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

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: Text(
          "What I Can Build 🚀",
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
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // HERO HEADER
                    const ServiceHero(),
                    const SizedBox(height: 24),

                    // RESPONSIVE CONTENT GRID
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;

                        if (width >= 1080) {
                          // Desktop 2-Column
                          return const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 11,
                                child: Column(
                                  children: [
                                    ServiceCard(
                                      icon: Icons.phone_android,
                                      title: "App Development",
                                      description:
                                          "High-performance mobile and web applications built for scale.",
                                    ),
                                    SizedBox(height: 16),
                                    ServiceCard(
                                      icon: Icons.design_services,
                                      title: "UI/UX Design",
                                      description:
                                          "Modern, intuitive and conversion-focused user interfaces.",
                                    ),
                                    SizedBox(height: 16),
                                    ServiceCard(
                                      icon: Icons.bug_report,
                                      title: "Optimization & Maintenance",
                                      description:
                                          "Improve performance, fix issues, and ensure smooth user experience.",
                                    ),
                                    SizedBox(height: 16),
                                    ServiceCard(
                                      icon: Icons.rocket_launch,
                                      title: "Launch & Deployment",
                                      description:
                                          "Complete app setup, optimization, and store deployment.",
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 24),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  children: [
                                    WhyWorkWithMeCard(),
                                    SizedBox(height: 16),
                                    WorkProcessCard(),
                                    SizedBox(height: 16),
                                    CapabilityChipsCard(),
                                    SizedBox(height: 16),
                                    SkillProficiencyCard(),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (width >= 720) {
                          // Tablet 2-Column
                          return const Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    ServiceCard(
                                      icon: Icons.phone_android,
                                      title: "App Development",
                                      description:
                                          "High-performance mobile and web applications built for scale.",
                                    ),
                                    SizedBox(height: 16),
                                    ServiceCard(
                                      icon: Icons.design_services,
                                      title: "UI/UX Design",
                                      description:
                                          "Modern, intuitive and conversion-focused user interfaces.",
                                    ),
                                    SizedBox(height: 16),
                                    WhyWorkWithMeCard(),
                                    SizedBox(height: 16),
                                    CapabilityChipsCard(),
                                  ],
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    ServiceCard(
                                      icon: Icons.bug_report,
                                      title: "Optimization & Maintenance",
                                      description:
                                          "Improve performance, fix issues, and ensure smooth user experience.",
                                    ),
                                    SizedBox(height: 16),
                                    ServiceCard(
                                      icon: Icons.rocket_launch,
                                      title: "Launch & Deployment",
                                      description:
                                          "Complete app setup, optimization, and store deployment.",
                                    ),
                                    SizedBox(height: 16),
                                    WorkProcessCard(),
                                    SizedBox(height: 16),
                                    SkillProficiencyCard(),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Mobile Single Column Stack
                          return const Column(
                            children: [
                              ServiceCard(
                                icon: Icons.phone_android,
                                title: "App Development",
                                description:
                                    "High-performance mobile and web applications built for scale.",
                              ),
                              SizedBox(height: 16),
                              ServiceCard(
                                icon: Icons.design_services,
                                title: "UI/UX Design",
                                description:
                                    "Modern, intuitive and conversion-focused user interfaces.",
                              ),
                              SizedBox(height: 16),
                              ServiceCard(
                                icon: Icons.bug_report,
                                title: "Optimization & Maintenance",
                                description:
                                    "Improve performance, fix issues, and ensure smooth user experience.",
                              ),
                              SizedBox(height: 16),
                              ServiceCard(
                                icon: Icons.rocket_launch,
                                title: "Launch & Deployment",
                                description:
                                    "Complete app setup, optimization, and store deployment.",
                              ),
                              SizedBox(height: 20),
                              WhyWorkWithMeCard(),
                              SizedBox(height: 20),
                              WorkProcessCard(),
                              SizedBox(height: 20),
                              CapabilityChipsCard(),
                              SizedBox(height: 20),
                              SkillProficiencyCard(),
                            ],
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 28),

                    // CTA SECTION
                    const ServiceCtaSection(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // VERTICAL SCROLL PROGRESS INDICATOR
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
