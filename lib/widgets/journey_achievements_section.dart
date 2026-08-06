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
  final List<String> highlights;

  const ActivityMoment({
    required this.id,
    required this.title,
    required this.category,
    required this.year,
    required this.caption,
    required this.imagePath,
    required this.fallbackIcon,
    this.highlights = const [],
  });
}

class JourneyAchievementsWidget extends StatefulWidget {
  const JourneyAchievementsWidget({super.key});

  static const List<ActivityMoment> moments = [
    ActivityMoment(
      id: 'nss_cert',
      title: 'NSS Official Certificate',
      category: 'NSS & Leadership',
      year: '2024',
      caption:
          'Awarded official NSS (National Service Scheme) certificate for dedicated community service, youth leadership, and organizing blood donation & awareness drives.',
      imagePath: 'assets/images/sagar_NSS_certificate.webp',
      fallbackIcon: Icons.card_membership_rounded,
      highlights: ['Community Service', 'Leadership', 'Social Awareness'],
    ),
    ActivityMoment(
      id: 'reel_award',
      title: '2nd Prize in Reel Making',
      category: 'Awards & Creative',
      year: '2025',
      caption:
          'Secured 2nd place in inter-college video storytelling & creative reel production competition, demonstrating video editing, pacing, and visual storytelling talent.',
      imagePath: 'assets/images/IMG_20250317_184157_596.webp',
      fallbackIcon: Icons.emoji_events_rounded,
      highlights: [
        '2nd Prize Winner',
        'Video Editing',
        'Creative Storytelling',
      ],
    ),
    ActivityMoment(
      id: 'nss_drama',
      title: 'NSS Drama & Cultural Dance',
      category: 'NSS & Leadership',
      year: '2024',
      caption:
          'Performed stage plays, street dramas, and cultural dances during NSS mega camps, spreading awareness on environmental conservation and youth empowerment.',
      imagePath: 'assets/images/sagar_NSS_photo_1.webp',
      fallbackIcon: Icons.theater_comedy_rounded,
      highlights: ['Stage Drama', 'Cultural Dance', 'Team Performance'],
    ),
    ActivityMoment(
      id: 'college_life',
      title: 'College Life & Tech Fests',
      category: 'College & Life',
      year: '2024 - 2025',
      caption:
          'Unforgettable moments with friends, campus fests, hackathons, and technical symposiums during computer science engineering studies.',
      imagePath: 'assets/images/sagar_college_photo.webp',
      fallbackIcon: Icons.groups_rounded,
      highlights: ['Campus Fests', 'Hackathons', 'Friendships'],
    ),
    ActivityMoment(
      id: 'gym_fitness',
      title: 'Gym & Fitness Journey',
      category: 'Gym & Fitness',
      year: '2023 - Present',
      caption:
          'Consistent strength training and daily physical fitness discipline that builds mental resilience, focus, and energy for long coding sessions.',
      imagePath: 'assets/images/sagar_gymphoto_1.webp',
      fallbackIcon: Icons.fitness_center_rounded,
      highlights: ['Strength Training', 'Mental Resilience', 'Discipline'],
    ),
  ];

  @override
  State<JourneyAchievementsWidget> createState() =>
      _JourneyAchievementsWidgetState();
}

class _JourneyAchievementsWidgetState extends State<JourneyAchievementsWidget> {
  String _selectedCategory = 'All';

  static const List<String> _categories = [
    'All',
    'NSS & Leadership',
    'Awards & Creative',
    'College & Life',
    'Gym & Fitness',
  ];

  List<ActivityMoment> get _filteredMoments {
    if (_selectedCategory == 'All') return JourneyAchievementsWidget.moments;
    return JourneyAchievementsWidget.moments
        .where((m) => m.category == _selectedCategory)
        .toList();
  }

  void _openMomentDialog(ActivityMoment moment) {
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
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? AppTheme.darkSurface : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.1)
                    : Colors.black.withValues(alpha: 0.1),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(alpha: 0.2),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          gradient: AppTheme.primaryGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          moment.category,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.close_rounded,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Image / Fallback Display
                  Hero(
                    tag: 'moment_hero_${moment.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 240,
                        width: double.infinity,
                        color: isDark
                            ? AppTheme.darkBackground
                            : Colors.grey.shade100,
                        child: Image.asset(
                          moment.imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            // Fallback view when user hasn't added photo yet
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
                                    size: 64,
                                    color: AppTheme.primaryBlue,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    moment.title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Drop photo in: ${moment.imagePath}',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white54,
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

                  // Title & Year
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
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryBlue.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
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

                  // Caption / Story
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
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.white.withValues(alpha: 0.05)
                              : Colors.black.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          '• $h',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white60 : Colors.black54,
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
                        'Journey & Achievements',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Beyond code: NSS, Reels, Drama, College & Fitness moments',
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
                  childAspectRatio: crossAxisCount == 1 ? 1.3 : 1.1,
                ),
                itemBuilder: (context, index) {
                  final moment = _filteredMoments[index];

                  return InkWell(
                    onTap: () => _openMomentDialog(moment),
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
                          // Top Image Container with Category Badge & Year
                          Expanded(
                            child: Stack(
                              children: [
                                Hero(
                                  tag: 'moment_hero_${moment.id}',
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                      top: Radius.circular(18),
                                    ),
                                    child: SizedBox(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Image.asset(
                                        moment.imagePath,
                                        fit: BoxFit.cover,
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

                                // Category Pill
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
                                      moment.category,
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
                                        alpha: 0.6,
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
