import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../widgets/scroll_progress_indicator.dart';

class ProjectItem {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imagePath;
  final List<String> technologies;
  final List<String> features;
  final String status;
  final String category;
  final String? projectUrl;
  final String? sourceUrl;
  final bool isFeatured;

  const ProjectItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imagePath,
    required this.technologies,
    required this.features,
    required this.status,
    required this.category,
    this.projectUrl,
    this.sourceUrl,
    this.isFeatured = false,
  });
}

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  static const List<ProjectItem> projectList = [
    ProjectItem(
      id: 'socialprox',
      title: 'SocialProX',
      subtitle: 'Cross-platform Social Media Application',
      description:
          'A real-world cross-platform social media application with real-time chat, posts, media sharing, and instant feed updates.',
      imagePath: 'assets/images/premium_futuristic_S_transparent.png',
      technologies: ['Flutter', 'Dart', 'Supabase', 'Cloudinary', 'REST APIs'],
      features: [
        '💬 Real-time Chat & Direct Messaging',
        '📰 Social Feed & Media Posts',
        '👤 User Profiles & Authentication',
        '⚡ Supabase Backend & Database',
      ],
      status: '📱 Published on Play Store',
      category: 'Social Media / Networking',
      projectUrl:
          'https://play.google.com/store/apps/details?id=com.socialprox.app',
      isFeatured: true,
    ),
    ProjectItem(
      id: 'mocktestprox',
      title: 'MockTestProX',
      subtitle: 'Competitive Exam Prep & Mock Test App',
      description:
          'A competitive exam preparation and mock-test application built for exams such as NEET, JEE, SSC, UPSC, Banking, and Railway with practice tests & analytics.',
      imagePath: 'assets/images/MockTestProx_.png',
      technologies: ['Flutter', 'Dart', 'Riverpod', 'Supabase'],
      features: [
        '📝 Practice Tests & Mock Exams (NEET, JEE, SSC, UPSC, Banking, Railway)',
        '📊 Exam-Focused Analytics & Performance Tracking',
        '⚡ Riverpod State Management & Supabase Integration',
      ],
      status: '🚧 In Development',
      category: 'Education / Exam Preparation',
      isFeatured: false,
    ),
    ProjectItem(
      id: 'portfolio',
      title: 'Sagar Borkar Portfolio',
      subtitle: 'Developer & Product Showcase Portfolio',
      description:
          'Personal cross-platform developer portfolio showcasing real-world software products, technical skills, and interactive photo gallery.',
      imagePath: 'assets/images/sagar_borkar_Sg.jpg',
      technologies: ['Flutter', 'Dart', 'Material 3', 'Riverpod'],
      features: [
        '🎨 Responsive Material 3 Design',
        '📸 Interactive Life & Achievements Lightbox',
        '🌓 Dark & Light Theme Modes',
        '⚡ Fast & Smooth 60 FPS Performance',
      ],
      status: '🟢 Live Portfolio',
      category: 'Developer Portfolio',
      sourceUrl: 'https://github.com/sagarborkar0888-wq',
      isFeatured: false,
    ),
  ];

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final ScrollController _scrollController = ScrollController();

  void _launchURL(String? url) async {
    if (url == null || url.isEmpty) return;
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _openProjectDetails(ProjectItem project) {
    showDialog(
      context: context,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 580),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.2),
                  blurRadius: 25,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Dialog Top Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          project.status,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.black.withValues(alpha: 0.05),
                          ),
                          child: Icon(
                            Icons.close_rounded,
                            color: isDark ? Colors.white70 : Colors.black87,
                            size: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Image Container
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 160,
                      width: double.infinity,
                      color: isDark
                          ? AppTheme.darkBackground
                          : Colors.grey.shade100,
                      child: Image.asset(
                        project.imagePath,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) => Center(
                          child: Icon(
                            Icons.apps_rounded,
                            size: 48,
                            color: AppTheme.primaryBlue.withValues(alpha: 0.5),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Title & Category
                  Text(
                    project.title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${project.subtitle} • ${project.category}',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Description
                  Text(
                    project.description,
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 14),

                  // Implemented Features
                  Text(
                    'Key Features',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Column(
                    children: project.features.map((feature) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle_rounded,
                              size: 15,
                              color: AppTheme.primaryBlue,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                feature,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: isDark
                                      ? Colors.white70
                                      : Colors.black87,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 14),

                  // Technologies
                  Text(
                    'Technologies',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children: project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isDark
                                ? Colors.white.withValues(alpha: 0.1)
                                : Colors.black.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Text(
                          tech,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 18),

                  // Actions
                  if (project.projectUrl != null || project.sourceUrl != null)
                    Row(
                      children: [
                        if (project.projectUrl != null)
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _launchURL(project.projectUrl);
                              },
                              icon: const Icon(Icons.shop_rounded, size: 15),
                              label: const Text('View on Play Store'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.primaryBlue,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        if (project.projectUrl != null &&
                            project.sourceUrl != null)
                          const SizedBox(width: 10),
                        if (project.sourceUrl != null)
                          Expanded(
                            child: OutlinedButton.icon(
                              onPressed: () {
                                Navigator.of(context).pop();
                                _launchURL(project.sourceUrl);
                              },
                              icon: const Icon(Icons.code_rounded, size: 15),
                              label: const Text('View Source Code'),
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppTheme.primaryBlue,
                                side: const BorderSide(
                                  color: AppTheme.primaryBlue,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

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

    final featuredProject = ProjectsSection.projectList.firstWhere(
      (p) => p.isFeatured,
    );
    final secondaryProjects = ProjectsSection.projectList
        .where((p) => !p.isFeatured)
        .toList();

    return Scaffold(
      backgroundColor: isDark
          ? AppTheme.darkBackground
          : const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        title: const Text(
          'Featured Projects',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : (isTablet ? 28 : 56),
              vertical: 12,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Subtitle Header
                    Text(
                      'Real applications, experiments, and products I’m building with modern technologies.',
                      style: TextStyle(
                        fontSize: 13,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 14),

                    // 1. PRIMARY FEATURED PROJECT CARD (SOCIALPROX)
                    _buildFeaturedProjectCard(
                      featuredProject,
                      isDark,
                      isMobile,
                    ),

                    const SizedBox(height: 20),

                    // 2. SECONDARY PROJECTS SECTION HEADER
                    Text(
                      'Other Applications & Projects',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // SECONDARY PROJECTS LIST (Overflow-proof Layout)
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: secondaryProjects.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return _buildCompactSecondaryCard(
                          secondaryProjects[index],
                          isDark,
                          isMobile,
                        );
                      },
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),

          // Vertical Glowing Scroll Progress Line along left edge (Matching Home & About)
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

  // ⭐ 1. PRIMARY FEATURED CARD (SOCIALPROX) - COMPACT & OVERFLOW-PROOF
  Widget _buildFeaturedProjectCard(
    ProjectItem project,
    bool isDark,
    bool isMobile,
  ) {
    return InkWell(
      onTap: () => _openProjectDetails(project),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(isMobile ? 14 : 20),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppTheme.primaryBlue.withValues(alpha: 0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryBlue.withValues(
                alpha: isDark ? 0.12 : 0.06,
              ),
              blurRadius: 20,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Status Row (Wrap prevents horizontal overflow on narrow mobile screens)
            Wrap(
              spacing: 8,
              runSpacing: 6,
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.star_rounded, size: 13, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        'Flagship Featured Project',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    project.status,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Responsive Content Layout
            if (isMobile) ...[
              // Image Container
              ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  color: isDark
                      ? AppTheme.darkBackground
                      : Colors.grey.shade100,
                  child: Image.asset(
                    project.imagePath,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    errorBuilder: (context, error, stackTrace) =>
                        const Icon(Icons.apps_rounded, size: 40),
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Details
              _buildFeaturedDetails(project, isDark),
            ] else ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Container
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Container(
                      height: 160,
                      width: 170,
                      color: isDark
                          ? AppTheme.darkBackground
                          : Colors.grey.shade100,
                      child: Image.asset(
                        project.imagePath,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.apps_rounded, size: 48),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18),

                  // Details
                  Expanded(child: _buildFeaturedDetails(project, isDark)),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedDetails(ProjectItem project, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🚀 ${project.title}',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          project.subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppTheme.primaryBlue,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          project.description,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 12,
            height: 1.4,
            color: isDark ? Colors.white70 : Colors.black87,
          ),
        ),
        const SizedBox(height: 10),

        // Tech Chips
        Wrap(
          spacing: 5,
          runSpacing: 5,
          children: project.technologies.map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.06)
                    : Colors.black.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.1)
                      : Colors.black.withValues(alpha: 0.1),
                ),
              ),
              child: Text(
                tech,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),

        // CTA
        OutlinedButton.icon(
          onPressed: () => _launchURL(project.projectUrl),
          icon: const Icon(Icons.shop_rounded, size: 14),
          label: const Text('View on Google Play →'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.primaryBlue,
            side: const BorderSide(color: AppTheme.primaryBlue),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }

  // 💼 2. COMPACT SECONDARY CARDS (MOCKTESTPROX & PORTFOLIO) - NO OVERFLOW
  Widget _buildCompactSecondaryCard(
    ProjectItem project,
    bool isDark,
    bool isMobile,
  ) {
    return InkWell(
      onTap: () => _openProjectDetails(project),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isDark ? AppTheme.darkSurface : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Project Image Thumbnail
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 80,
                height: 80,
                color: isDark ? AppTheme.darkBackground : Colors.grey.shade100,
                child: Image.asset(
                  project.imagePath,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                  errorBuilder: (context, error, stackTrace) =>
                      const Center(child: Icon(Icons.apps_rounded, size: 32)),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          project.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.08)
                              : Colors.black.withValues(alpha: 0.06),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          project.status,
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),

                  Text(
                    project.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 11,
                      color: isDark ? Colors.white60 : Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Technologies Row
                  Wrap(
                    spacing: 4,
                    runSpacing: 4,
                    children: project.technologies.map((tech) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(
                            alpha: isDark ? 0.12 : 0.06,
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(
                          tech,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 8),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 13,
              color: isDark ? Colors.white38 : Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
