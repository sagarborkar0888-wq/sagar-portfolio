import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../helpers/ui_helper.dart';
import '../widgets/scroll_progress_indicator.dart';
import 'contact_section.dart';
import 'projects_section.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 650;
    final isTablet = width >= 650 && width < 1000;

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackground
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'About Me',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Single Scrollable Feed with Compact Spacing
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : (isTablet ? 28 : 56),
              vertical: 14,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. HERO HEADER CARD
                    _buildHeroCard(context, isDark, isMobile),

                    const SizedBox(height: 16),

                    // RESPONSIVE LAYOUT FOR ABOUT & MISSION
                    if (isMobile) ...[
                      _buildAboutCard(isDark),
                      const SizedBox(height: 16),
                      _buildMissionSection(isDark, isMobile),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 6, child: _buildAboutCard(isDark)),
                          const SizedBox(width: 16),
                          Expanded(
                            flex: 5,
                            child: _buildMissionSection(isDark, isMobile),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 18),

                    // 4. WHAT I BUILD (CAPABILITIES)
                    _buildCapabilitiesSection(isDark, isMobile),

                    const SizedBox(height: 18),

                    // 5. TECH STACK
                    _buildTechStackSection(isDark),

                    const SizedBox(height: 18),

                    // RESPONSIVE LAYOUT FOR BEYOND CODE & SOCIALPROX
                    if (isMobile) ...[
                      _buildBeyondCodeSection(context, isDark),
                      const SizedBox(height: 16),
                      _buildSocialProXCard(context, isDark),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildBeyondCodeSection(context, isDark),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildSocialProXCard(context, isDark),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 20),

                    // 7. SOCIAL & CONTACT ACTIONS
                    _buildContactActions(context, isDark, isMobile),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Vertical Glowing Scroll Progress Line along the left edge
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: ScrollProgressIndicator(scrollController: _scrollController),
          ),
        ],
      ),
    );
  }

  // 👤 HERO HEADER CARD
  Widget _buildHeroCard(BuildContext context, bool isDark, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 16 : 22),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryBlue.withValues(alpha: isDark ? 0.12 : 0.06),
            blurRadius: 20,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          // Circular Profile Image with Gradient Border & Soft Glow
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: AppTheme.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.25),
                  blurRadius: 16,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/sagar_borkar_Sg.jpg'),
            ),
          ),
          const SizedBox(height: 12),

          // Name
          Text(
            'Sagar Borkar',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 22 : 26,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),

          // Subtitle Title
          Text(
            'Flutter Developer • Android Developer • Full Stack App Developer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isMobile ? 12 : 14,
              fontWeight: FontWeight.w600,
              color: AppTheme.primaryBlue,
            ),
          ),
          const SizedBox(height: 4),

          // Tagline
          Text(
            'Founder & Developer of SocialProX',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: isDark ? Colors.white60 : Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),

          // Availability Badge Pill
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: const Color(0xFF10B981).withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF10B981).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.circle, size: 7, color: Color(0xFF10B981)),
                SizedBox(width: 6),
                Text(
                  'Available for Freelance & Collaborations',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF10B981),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 💡 ABOUT INTRODUCTION CARD
  Widget _buildAboutCard(bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_rounded,
                color: AppTheme.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'About Me',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'I am a Full Stack App Developer focused on building high-quality, responsive, and scalable mobile and web applications.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'I specialize in creating real-world software products with clean UI, smooth performance, and production-ready architecture.',
            style: TextStyle(
              fontSize: 13,
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 14),

          // Highlight Tech Chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: [
              _buildHighlightChip('Flutter', isDark),
              _buildHighlightChip('Dart', isDark),
              _buildHighlightChip('Android', isDark),
              _buildHighlightChip('Cross-platform', isDark),
              _buildHighlightChip('Supabase', isDark),
              _buildHighlightChip('REST APIs', isDark),
              _buildHighlightChip('SocialProX', isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHighlightChip(String label, bool isDark) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: AppTheme.primaryBlue.withValues(alpha: isDark ? 0.12 : 0.08),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.25)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: AppTheme.primaryBlue,
        ),
      ),
    );
  }

  // 🎯 DEVELOPER MISSION SECTION
  Widget _buildMissionSection(bool isDark, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.ads_click_rounded,
              color: AppTheme.secondaryPurple,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'My Mission',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        _buildMissionCard(
          icon: Icons.lightbulb_rounded,
          title: 'Solve Real Problems',
          description:
              'Build applications that provide genuine value and solve real-world user challenges.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildMissionCard(
          icon: Icons.widgets_rounded,
          title: 'Build Digital Products',
          description:
              'Create scalable, intuitive, and useful software products with clean architecture.',
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        _buildMissionCard(
          icon: Icons.rocket_launch_rounded,
          title: 'Build Independence & Impact',
          description:
              'Use technology to create meaningful opportunities, independence, and positive impact.',
          isDark: isDark,
        ),
      ],
    );
  }

  Widget _buildMissionCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.secondaryPurple.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.secondaryPurple, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.3,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ⚡ WHAT I BUILD (CAPABILITIES)
  Widget _buildCapabilitiesSection(bool isDark, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.build_circle_rounded,
              color: AppTheme.primaryBlue,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              'What I Build',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        GridView.count(
          crossAxisCount: isMobile ? 1 : 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: isMobile ? 2.8 : 2.4,
          children: [
            _buildCapabilityCard(
              icon: Icons.phone_android_rounded,
              title: 'Mobile & Cross-Platform',
              description:
                  'Flutter-based high-performance Android & iOS applications.',
              isDark: isDark,
            ),
            _buildCapabilityCard(
              icon: Icons.cloud_done_rounded,
              title: 'Backend Integration',
              description:
                  'Supabase, Firebase, REST APIs, and Cloudinary integrations.',
              isDark: isDark,
            ),
            _buildCapabilityCard(
              icon: Icons.palette_rounded,
              title: 'UI/UX Design',
              description:
                  'Responsive, modern, and user-focused digital interfaces.',
              isDark: isDark,
            ),
            _buildCapabilityCard(
              icon: Icons.rocket_rounded,
              title: 'Deployment & Release',
              description:
                  'Google Play Store publishing and production app maintenance.',
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCapabilityCard({
    required IconData icon,
    required String title,
    required String description,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: AppTheme.primaryBlue, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: isDark ? Colors.white : Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 11,
                    height: 1.3,
                    color: isDark ? Colors.white60 : Colors.black54,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 🧠 TECH STACK SECTION
  Widget _buildTechStackSection(bool isDark) {
    final techStack = [
      'Flutter',
      'Dart',
      'Supabase',
      'Firebase',
      'Cloudinary',
      'REST APIs',
      'UI/UX',
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.memory_rounded,
                color: AppTheme.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Tech Stack',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: techStack.map((tech) {
              return Chip(
                label: Text(tech),
                labelStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white : Colors.black87,
                ),
                backgroundColor: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.04),
                side: BorderSide(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.1),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  // 🎭 BEYOND CODE (INTERESTS)
  Widget _buildBeyondCodeSection(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.interests_rounded,
                color: AppTheme.secondaryPurple,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Beyond Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: const [
              Chip(label: Text('🏋️ Gym')),
              Chip(label: Text('💻 Tech')),
              Chip(label: Text('🎮 Gaming')),
              Chip(label: Text('🌍 Travel')),
            ],
          ),
          const SizedBox(height: 14),
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            borderRadius: BorderRadius.circular(10),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Explore Life & Achievements',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: 15,
                    color: AppTheme.primaryBlue,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🚀 SOCIALPROX HIGHLIGHT CARD
  Widget _buildSocialProXCard(BuildContext context, bool isDark) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppTheme.primaryBlue.withValues(alpha: isDark ? 0.18 : 0.08),
            AppTheme.secondaryPurple.withValues(alpha: isDark ? 0.18 : 0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.primaryBlue.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.rocket_launch_rounded,
                color: AppTheme.primaryBlue,
                size: 20,
              ),
              const SizedBox(width: 8),
              Text(
                'Founder of SocialProX',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'SocialProX is a real-world cross-platform social media application built using Flutter, Supabase, and modern backend services featuring real-time feeds, media sharing, and chat.',
            style: TextStyle(
              fontSize: 12,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 14),
          OutlinedButton.icon(
            onPressed: () {
              UiHelper.navigateWithSlideTransition(
                context,
                const ProjectsSection(),
              );
            },
            icon: const Icon(Icons.arrow_forward_rounded, size: 15),
            label: const Text('Explore Projects'),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppTheme.primaryBlue,
              side: const BorderSide(color: AppTheme.primaryBlue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 7. SOCIAL & CONTACT ACTIONS
  Widget _buildContactActions(
    BuildContext context,
    bool isDark,
    bool isMobile,
  ) {
    return Column(
      children: [
        // Sleek & Compact Action Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: [
            _buildActionButton(
              label: 'View My Work',
              icon: Icons.arrow_forward_rounded,
              isPrimary: true,
              isDark: isDark,
              onTap: () {
                UiHelper.navigateWithSlideTransition(
                  context,
                  const ProjectsSection(),
                );
              },
            ),
            _buildActionButton(
              label: 'Contact Me',
              icon: Icons.mail_outline_rounded,
              isPrimary: false,
              isDark: isDark,
              onTap: () {
                UiHelper.navigateWithSlideTransition(
                  context,
                  const ContactSection(),
                );
              },
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Compact Social Buttons
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _buildSocialPill(
              icon: Icons.email_rounded,
              label: 'Email',
              onTap: () =>
                  UiHelper.launchUrlLink('mailto:sagarborkar0888@example.com'),
              isDark: isDark,
            ),
            _buildSocialPill(
              icon: Icons.link_rounded,
              label: 'LinkedIn',
              onTap: () => UiHelper.launchUrlLink(
                'https://www.linkedin.com/in/sagar-borkar-724ba7315?utm_source=share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app',
              ),
              isDark: isDark,
            ),
            _buildSocialPill(
              icon: Icons.code_rounded,
              label: 'GitHub',
              onTap: () => UiHelper.launchUrlLink(
                'https://github.com/sagarborkar0888-wq',
              ),
              isDark: isDark,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialPill({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : Colors.black.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.1)
                : Colors.black.withValues(alpha: 0.1),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 15, color: AppTheme.primaryBlue),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isDark ? Colors.white70 : Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
    required bool isPrimary,
    required bool isDark,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          gradient: isPrimary ? AppTheme.primaryGradient : null,
          color: isPrimary
              ? null
              : (isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.05)),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isPrimary
                ? AppTheme.primaryBlue
                : (isDark
                      ? Colors.white.withValues(alpha: 0.12)
                      : Colors.black.withValues(alpha: 0.12)),
          ),
          boxShadow: isPrimary
              ? [
                  BoxShadow(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.25),
                    blurRadius: 10,
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: isPrimary
                    ? Colors.white
                    : (isDark ? Colors.white : Colors.black87),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              icon,
              size: 15,
              color: isPrimary
                  ? Colors.white
                  : (isDark ? Colors.white70 : Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
