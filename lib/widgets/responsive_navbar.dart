import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/providers/navigation_provider.dart';
import '../core/providers/theme_provider.dart';
import '../core/theme/app_theme.dart';

class ResponsiveNavbar extends ConsumerWidget implements PreferredSizeWidget {
  final Function(NavigationSection section) onSectionSelected;
  final ScrollController? scrollController;

  const ResponsiveNavbar({
    super.key,
    required this.onSectionSelected,
    this.scrollController,
  });

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeSection = ref.watch(activeSectionProvider);
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark;
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width >= 900;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? AppTheme.darkBackground.withValues(alpha: 0.95)
            : Colors.white.withValues(alpha: 0.95),
        border: Border(
          bottom: BorderSide(
            color: isDark
                ? Colors.white.withValues(alpha: 0.08)
                : Colors.black.withValues(alpha: 0.08),
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Logo & Name
                  InkWell(
                    onTap: () => onSectionSelected(NavigationSection.home),
                    borderRadius: BorderRadius.circular(20),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              gradient: AppTheme.primaryGradient,
                              shape: BoxShape.circle,
                            ),
                            child: const Text(
                              'SB',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ShaderMask(
                            shaderCallback: (bounds) =>
                                AppTheme.primaryGradient.createShader(bounds),
                            child: const Text(
                              'Sagar Borkar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Right action items (Nav links, theme toggle, mobile menu)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isDesktop)
                        ...NavigationSection.values.map((section) {
                          final isSelected = activeSection == section;
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: InkWell(
                              onTap: () {
                                ref.read(activeSectionProvider.notifier).state =
                                    section;
                                onSectionSelected(section);
                              },
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppTheme.primaryBlue.withValues(
                                          alpha: 0.15,
                                        )
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(20),
                                  border: isSelected
                                      ? Border.all(
                                          color: AppTheme.primaryBlue
                                              .withValues(alpha: 0.4),
                                        )
                                      : null,
                                ),
                                child: Text(
                                  section.label,
                                  style: TextStyle(
                                    color: isSelected
                                        ? AppTheme.primaryBlue
                                        : (isDark
                                              ? Colors.white70
                                              : Colors.black87),
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      const SizedBox(width: 4),

                      // Dark / Light Theme Toggle Button
                      IconButton(
                        tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
                        icon: Icon(
                          isDark
                              ? Icons.light_mode_rounded
                              : Icons.dark_mode_rounded,
                          color: isDark ? Colors.amber : AppTheme.primaryBlue,
                        ),
                        onPressed: () {
                          ref.read(themeModeProvider.notifier).state = isDark
                              ? ThemeMode.light
                              : ThemeMode.dark;
                        },
                      ),

                      if (!isDesktop) ...[
                        const SizedBox(width: 4),
                        IconButton(
                          icon: Icon(
                            Icons.menu_rounded,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          onPressed: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
