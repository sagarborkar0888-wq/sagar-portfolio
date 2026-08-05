import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';

class ActivityMoment {
  final String id;
  final String title;
  final String category;
  final String year;
  final String caption;
  final String imagePath;
  final IconData fallbackIcon;
  final String badgeText;
  final List<String> highlights;
  final Alignment imageAlignment;
  final BoxFit imageFit;

  const ActivityMoment({
    required this.id,
    required this.title,
    required this.category,
    required this.year,
    required this.caption,
    required this.imagePath,
    required this.fallbackIcon,
    required this.badgeText,
    this.highlights = const [],
    this.imageAlignment = Alignment.topCenter,
    this.imageFit = BoxFit.cover,
  });
}

class ActivityGalleryWidget extends StatefulWidget {
  const ActivityGalleryWidget({super.key});

  static const List<ActivityMoment> moments = [
    // 👤 PERSONAL (8 photos)
    ActivityMoment(
      id: 'personal_1',
      title: 'Personal Journey',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption: 'Personal reflections and professional growth journey.',
      imagePath: 'assets/images/sagar_persional_photo_1.png',
      fallbackIcon: Icons.person_rounded,
      highlights: ['Personal Growth', 'Journey', 'Self-Improvement'],
    ),
    ActivityMoment(
      id: 'personal_2',
      title: 'Building My Path',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption:
          'Learning, evolving, and building a strong foundation for the future.',
      imagePath: 'assets/images/sagar_persional_photo_2.png',
      fallbackIcon: Icons.explore_rounded,
      highlights: ['Path Building', 'Learning', 'Vision'],
    ),
    ActivityMoment(
      id: 'personal_3',
      title: 'Beyond Coding',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption:
          'Exploring life experiences, hobbies, and personal perspectives.',
      imagePath: 'assets/images/sagar_persional_photo_3.jpg',
      fallbackIcon: Icons.self_improvement_rounded,
      highlights: ['Life Balance', 'Perspectives', 'Interests'],
    ),
    ActivityMoment(
      id: 'personal_4',
      title: 'Personal Milestone',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption: 'Key moments and personal milestones along the way.',
      imagePath: 'assets/images/sagar_persional_photo_4.jpg',
      fallbackIcon: Icons.flag_rounded,
      highlights: ['Milestone', 'Reflection', 'Experience'],
    ),
    ActivityMoment(
      id: 'personal_5',
      title: 'Life & Perspective',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption:
          'Gaining fresh insights through continuous learning and experiences.',
      imagePath: 'assets/images/sagar_persional_photo_5.jpg',
      fallbackIcon: Icons.lightbulb_rounded,
      highlights: ['Insights', 'Perspective', 'Mindset'],
    ),
    ActivityMoment(
      id: 'personal_6',
      title: 'Focus & Drive',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption:
          'Staying committed to long-term personal and professional goals.',
      imagePath: 'assets/images/sagar_persional_photo_7.jpg',
      fallbackIcon: Icons.center_focus_strong_rounded,
      highlights: ['Focus', 'Determination', 'Consistency'],
    ),
    ActivityMoment(
      id: 'personal_7',
      title: 'Moments & Memories',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption: 'Cherished memories and personal life snapshots.',
      imagePath: 'assets/images/sagar_persional_photo_9.jpg',
      fallbackIcon: Icons.collections_rounded,
      highlights: ['Memories', 'Snapshots', 'Life'],
    ),
    ActivityMoment(
      id: 'personal_8',
      title: 'Personal Path',
      category: 'Personal',
      year: '2024',
      badgeText: '👤 Personal',
      caption: 'Embracing challenges and stepping forward with clarity.',
      imagePath: 'assets/images/sagar_persional_photo_10.jpg',
      fallbackIcon: Icons.alt_route_rounded,
      highlights: ['Clarity', 'Growth', 'Forward Drive'],
    ),

    // 📜 NSS & VOLUNTEERING (3 photos)
    ActivityMoment(
      id: 'nss_1',
      title: 'NSS Public Speaking',
      category: 'NSS & Volunteering',
      year: '2024',
      badgeText: '📜 NSS & Volunteering',
      caption:
          'Speaking into a microphone during a public NSS community activity and youth engagement drive.',
      imagePath: 'assets/images/sagar_NSS_photo_with_mike_4.jpg',
      fallbackIcon: Icons.record_voice_over_rounded,
      highlights: ['Public Speaking', 'NSS Leadership', 'Community Drive'],
    ),
    ActivityMoment(
      id: 'nss_2',
      title: 'NSS Certificate',
      category: 'NSS & Volunteering',
      year: '2024',
      badgeText: '📜 NSS & Volunteering',
      caption:
          'Receiving official NSS (National Service Scheme) certificate for dedicated social service and volunteering.',
      imagePath: 'assets/images/sagar_NSS_certificate.jpg',
      fallbackIcon: Icons.card_membership_rounded,
      highlights: ['NSS Certificate', 'Social Service', 'Recognition'],
    ),
    ActivityMoment(
      id: 'nss_3',
      title: 'Community & Social Activity',
      category: 'NSS & Volunteering',
      year: '2024',
      badgeText: '📜 NSS & Volunteering',
      caption:
          'Participating in public social awareness campaigns, environmental initiatives, and community service.',
      imagePath: 'assets/images/sagar_NSS_publicphoto_7.JPG',
      fallbackIcon: Icons.volunteer_activism_rounded,
      highlights: ['Community Work', 'Social Awareness', 'Volunteering'],
    ),

    // 🎭 DRAMA & CREATIVE (5 photos)
    ActivityMoment(
      id: 'drama_1',
      title: 'NSS Drama Performance',
      category: 'Drama & Creative',
      year: '2024',
      badgeText: '🎭 Stage Role',
      caption:
          'Stage drama performance conveying social awareness messages during NSS cultural events.',
      imagePath: 'assets/images/sagar_NSS_photo_1.JPG',
      fallbackIcon: Icons.theater_comedy_rounded,
      highlights: ['Stage Drama', 'NSS Cultural', 'Social Message'],
    ),
    ActivityMoment(
      id: 'drama_2',
      title: 'Stage Role & Dialogue',
      category: 'Drama & Creative',
      year: '2024',
      badgeText: '🎭 Stage Role',
      caption:
          'Performing a character role on stage holding a microphone alongside fellow student drama cast members.',
      imagePath: 'assets/images/sagar_NSS_photo_2.JPG',
      fallbackIcon: Icons.mic_external_on_rounded,
      highlights: ['Stage Role', 'Character Acting', 'Team Performance'],
    ),
    ActivityMoment(
      id: 'drama_3',
      title: 'Cultural Performance',
      category: 'Drama & Creative',
      year: '2024',
      badgeText: '🎭 Stage Role',
      caption:
          'Theatrical performance and artistic expression in front of a live college audience.',
      imagePath: 'assets/images/sagar_NSS_photo_3.JPG',
      fallbackIcon: Icons.masks_rounded,
      highlights: ['Cultural Stage', 'Acting Expression', 'Live Audience'],
    ),
    ActivityMoment(
      id: 'drama_4',
      title: 'Social Awareness Play',
      category: 'Drama & Creative',
      year: '2024',
      badgeText: '🎭 Stage Role',
      caption:
          'Enacting a social awareness script highlighting key youth and societal topics.',
      imagePath: 'assets/images/sagar_NSS_photo_5.JPG',
      fallbackIcon: Icons.campaign_rounded,
      highlights: ['Social Awareness', 'Theatrical Play', 'Impact'],
    ),
    ActivityMoment(
      id: 'drama_5',
      title: 'Creative Stage Performance',
      category: 'Drama & Creative',
      year: '2024',
      badgeText: '🎭 Stage Role',
      caption:
          'Collaborative stage act demonstrating creative expression, dialogue delivery, and stage presence.',
      imagePath: 'assets/images/sagar_NSS_photo_6.JPG',
      fallbackIcon: Icons.draw_rounded,
      highlights: ['Creative Expression', 'Stage Presence', 'Drama Cast'],
    ),

    // 🏋️ GYM & FITNESS (3 photos)
    ActivityMoment(
      id: 'gym_1',
      title: 'Fitness Journey',
      category: 'Gym & Fitness',
      year: '2023 - Present',
      badgeText: '🏋️ Gym & Fitness',
      caption:
          'Dedication to physical fitness, healthy habits, and daily strength training routines.',
      imagePath: 'assets/images/sagar_gymphoto_1.jpg',
      fallbackIcon: Icons.fitness_center_rounded,
      highlights: ['Physical Fitness', 'Healthy Habits', 'Training'],
      imageAlignment: Alignment.center,
    ),
    ActivityMoment(
      id: 'gym_2',
      title: 'Strength & Discipline',
      category: 'Gym & Fitness',
      year: '2023 - Present',
      badgeText: '🏋️ Gym & Discipline',
      caption:
          'Strength training discipline that builds mental clarity, focus, and physical endurance.',
      imagePath: 'assets/images/sagar_gymphoto_2.jpg',
      fallbackIcon: Icons.psychology_rounded,
      highlights: ['Strength', 'Discipline', 'Mental Clarity'],
      imageAlignment: Alignment.center,
    ),
    ActivityMoment(
      id: 'gym_3',
      title: 'Training & Consistency',
      category: 'Gym & Fitness',
      year: '2023 - Present',
      badgeText: '🏋️ Gym & Consistency',
      caption:
          'Maintaining consistent workouts for sustained energy, physical health, and stamina.',
      imagePath: 'assets/images/sagar_gymphoto_3.jpg',
      fallbackIcon: Icons.repeat_rounded,
      highlights: ['Consistency', 'Stamina', 'Energy'],
      imageAlignment: Alignment.center,
    ),

    // 🎓 COLLEGE & EDUCATION (3 photos)
    ActivityMoment(
      id: 'college_1',
      title: 'Academic Achievement',
      category: 'College & Education',
      year: '2024',
      badgeText: '🎓 Academic Result',
      caption:
          'Physics Department academic result milestone — Sagar V. Borkar: Phy. 128 (85.33%), SGPA 8.09 (73.40%).',
      imagePath: 'assets/images/sagar_Phy_SGPA_photo.jpg',
      fallbackIcon: Icons.school_rounded,
      highlights: ['Physics: 85.33%', 'SGPA: 8.09', 'Academic Progress'],
    ),
    ActivityMoment(
      id: 'college_2',
      title: 'B.Sc. Computer Science (NEP)',
      category: 'College & Education',
      year: '2024 - 2025',
      badgeText: '🎓 Education / NEP',
      caption:
          'Pursuing B.Sc. Computer Science under National Education Policy (NEP) Programme.',
      imagePath: 'assets/images/sagar_education_1.jpg',
      fallbackIcon: Icons.menu_book_rounded,
      highlights: [
        'B.Sc. Computer Science',
        'NEP Programme',
        'Higher Education',
      ],
    ),
    ActivityMoment(
      id: 'college_3',
      title: 'College Life & Memories',
      category: 'College & Education',
      year: '2024 - 2025',
      badgeText: '🎓 Campus Life',
      caption:
          'College campus memories, tech events, and learning experiences.',
      imagePath: 'assets/images/sagar_college_photo.jpg',
      fallbackIcon: Icons.groups_rounded,
      highlights: ['College Campus', 'Tech Events'],
      imageAlignment: Alignment.bottomCenter,
    ),

    // 📸 ADDITIONAL SLOTS WITH UPLOADS
    ActivityMoment(
      id: 'personal_9',
      title: 'Personal Milestone',
      category: 'Personal',
      year: '2025',
      badgeText: '👤 Personal',
      caption: 'Memorable moment and personal journey snapshot.',
      imagePath: 'assets/images/IMG_20250317_184157_596.jpg',
      fallbackIcon: Icons.photo_camera_rounded,
      highlights: ['Personal Snapshot', 'Life Experience'],
    ),
    ActivityMoment(
      id: 'personal_10',
      title: 'Personal Perspective',
      category: 'Personal',
      year: '2025',
      badgeText: '👤 Personal',
      caption: 'Growth, reflection, and self-improvement.',
      imagePath: 'assets/images/retouch_2025083022023435.jpg',
      fallbackIcon: Icons.auto_awesome_rounded,
      highlights: ['Reflection', 'Growth'],
    ),
  ];

  @override
  State<ActivityGalleryWidget> createState() => _ActivityGalleryWidgetState();
}

class _ActivityGalleryWidgetState extends State<ActivityGalleryWidget> {
  String _selectedCategory = 'All';

  static const List<String> _categories = [
    'All',
    'Personal',
    'NSS & Volunteering',
    'Drama & Creative',
    'College & Education',
    'Gym & Fitness',
  ];

  List<ActivityMoment> get _filteredMoments {
    if (_selectedCategory == 'All') return ActivityGalleryWidget.moments;
    return ActivityGalleryWidget.moments
        .where((m) => m.category == _selectedCategory)
        .toList();
  }

  void _openLightboxDialog(ActivityMoment moment) {
    showDialog(
      context: context,
      builder: (context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final width = MediaQuery.of(context).size.width;
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 24,
          ),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 640),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.12)
                    : Colors.black.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.25),
                  blurRadius: 35,
                  spreadRadius: 6,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Dialog Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          moment.badgeText,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
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
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Image / Fallback Photo Container
                  Hero(
                    tag: 'activity_hero_${moment.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Container(
                        height: width < 600 ? 320 : 400,
                        width: double.infinity,
                        color: isDark
                            ? AppTheme.darkBackground
                            : Colors.grey.shade100,
                        child: Image.asset(
                          moment.imagePath,
                          fit: moment.imageFit,
                          alignment: moment.imageAlignment,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppTheme.primaryBlue.withValues(alpha: 0.3),
                                    AppTheme.secondaryPurple.withValues(
                                      alpha: 0.3,
                                    ),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    moment.fallbackIcon,
                                    size: 68,
                                    color: AppTheme.primaryBlue,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    moment.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.3,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      '📸 Image path: ${moment.imagePath}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title & Year Badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          moment.title,
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                          ),
                        ),
                        child: Text(
                          moment.year,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Caption Description
                  Text(
                    moment.caption,
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: isDark ? Colors.white70 : Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Highlight Chips
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: moment.highlights.map((h) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.06)
                              : Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '• $h',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.white70 : Colors.black87,
                          ),
                        ),
                      );
                    }).toList(),
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
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width > 900
        ? 3
        : width > 600
        ? 2
        : 1;

    return RepaintBoundary(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark
              ? AppTheme.darkSurface.withValues(alpha: 0.6)
              : Colors.white.withValues(alpha: 0.8),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title Header
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    gradient: AppTheme.primaryGradient,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.photo_library_rounded,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '📸 Life, Achievements & Beyond Code',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Real-life moments: Personal, NSS Volunteering, Stage Drama, Education & Fitness',
                        style: TextStyle(
                          fontSize: 13,
                          color: isDark ? Colors.white60 : Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Filter Chips Bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories.map((category) {
                  final isSelected = _selectedCategory == category;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: FilterChip(
                      selected: isSelected,
                      label: Text(category),
                      labelStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.w500,
                        color: isSelected
                            ? Colors.white
                            : (isDark ? Colors.white70 : Colors.black87),
                      ),
                      selectedColor: AppTheme.primaryBlue,
                      backgroundColor: isDark
                          ? Colors.white.withValues(alpha: 0.05)
                          : Colors.black.withValues(alpha: 0.05),
                      checkmarkColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                          color: isSelected
                              ? AppTheme.primaryBlue
                              : Colors.transparent,
                        ),
                      ),
                      onSelected: (_) {
                        setState(() {
                          _selectedCategory = category;
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),

            // Responsive Moments Grid
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: GridView.builder(
                key: ValueKey<String>(_selectedCategory),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _filteredMoments.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: crossAxisCount == 1 ? 0.95 : 0.85,
                ),
                itemBuilder: (context, index) {
                  final moment = _filteredMoments[index];

                  return InkWell(
                    onTap: () => _openLightboxDialog(moment),
                    borderRadius: BorderRadius.circular(18),
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark
                            ? AppTheme.darkBackground.withValues(alpha: 0.8)
                            : Colors.grey.shade50,
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
                          // Image Container with Badge & Year
                          Expanded(
                            child: Stack(
                              children: [
                                Hero(
                                  tag: 'activity_hero_${moment.id}',
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(18),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.asset(
                                        moment.imagePath,
                                        fit: moment.imageFit,
                                        alignment: moment.imageAlignment,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                              return Container(
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppTheme.primaryBlue
                                                          .withValues(
                                                            alpha: 0.25,
                                                          ),
                                                      AppTheme.secondaryPurple
                                                          .withValues(
                                                            alpha: 0.25,
                                                          ),
                                                    ],
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    moment.fallbackIcon,
                                                    size: 48,
                                                    color: AppTheme.primaryBlue,
                                                  ),
                                                ),
                                              );
                                            },
                                      ),
                                    ),
                                  ),
                                ),

                                // Badge Pill
                                Positioned(
                                  top: 10,
                                  left: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      gradient: AppTheme.primaryGradient,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      moment.badgeText,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),

                                // Year Pill
                                Positioned(
                                  top: 10,
                                  right: 10,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.65,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      moment.year,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Card Details
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  moment.title,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: isDark
                                        ? Colors.white
                                        : Colors.black87,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  moment.caption,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isDark
                                        ? Colors.white60
                                        : Colors.black54,
                                    height: 1.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
