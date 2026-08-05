import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/theme/app_theme.dart';
import '../widgets/scroll_progress_indicator.dart';

class PricingSection extends StatefulWidget {
  const PricingSection({super.key});

  @override
  State<PricingSection> createState() => _PricingSectionState();
}

class _PricingSectionState extends State<PricingSection> {
  final ScrollController _scrollController = ScrollController();

  // Project Estimator State
  int _selectedTierIndex = 1; // Default to Standard App (index 1)
  int _selectedScreenIndex = 1; // Default to 6-15 screens

  static const List<String> screenRanges = [
    '2–5 Screens',
    '6–15 Screens',
    '16–30+ Screens',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _launchWhatsApp(String message) async {
    final url =
        "https://wa.me/918788357452?text=${Uri.encodeComponent(message)}";
    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      }
    } catch (e) {
      try {
        await launchUrl(uri, mode: LaunchMode.platformDefault);
      } catch (err) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not open WhatsApp: $err'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    }
  }

  void _openProjectInquiry({String? packageTitle, String? estimatedPrice}) {
    final title = packageTitle ?? 'Standard App';
    final price = estimatedPrice ?? '₹25,000 – ₹60,000';
    final screens = screenRanges[_selectedScreenIndex];

    final message =
        """
🚀 *Project Inquiry*

👋 Hi Sagar,

I am interested in starting a project with you!

📌 *Selected Details:*
- Package: $title
- Estimated Price: $price
- Screens: $screens

📝 *My Requirements:*
- Project Idea: 
- Desired Features: 
- Timeline: 

Looking forward to discussing the project with you.
Thank you!
""";

    _launchWhatsApp(message);
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
          'Services & Pricing',
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
              horizontal: isMobile ? 14 : (isTablet ? 24 : 48),
              vertical: 14,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 980),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. SECTION HEADER
                    _buildHeader(isDark),

                    const SizedBox(height: 20),

                    // 2. 💰 HOW PRICING WORKS
                    _buildHowPricingWorksCard(isDark),

                    const SizedBox(height: 24),

                    // 3. 💼 SERVICES OFFERED (WHAT I CAN BUILD)
                    _buildServicesGrid(isDark, isMobile),

                    const SizedBox(height: 24),

                    // 4. 📦 WHAT YOU GET INCLUDED
                    _buildWhatYouGetCard(isDark, isMobile),

                    const SizedBox(height: 24),

                    // 5. 📱 APP DEVELOPMENT PACKAGES (PRICING CARDS)
                    _buildSectionHeader(
                      title: 'App Development Packages',
                      icon: Icons.phone_android_rounded,
                      isDark: isDark,
                      badgeText: 'Starting Rates',
                    ),
                    const SizedBox(height: 12),

                    if (isMobile) ...[
                      _buildPricingCard(
                        title: 'Basic App',
                        priceInr: '₹10,000 – ₹25,000',
                        priceUsd: '\$120 – \$300',
                        screens: '2–5 Screens',
                        delivery: '5–10 Days',
                        revisions: '1 Revision',
                        support: 'App Delivery Only',
                        features: [
                          'Clean & Responsive UI',
                          'Core Functional Features',
                          'Signed APK/AAB Build',
                          'Standard Code Setup',
                        ],
                        isRecommended: false,
                        isDark: isDark,
                      ),
                      const SizedBox(height: 14),
                      _buildPricingCard(
                        title: 'Standard App',
                        priceInr: '₹25,000 – ₹60,000',
                        priceUsd: '\$300 – \$750',
                        screens: '6–15 Screens',
                        delivery: '10–18 Days',
                        revisions: '2 Revisions',
                        support: '7 Days Post-Delivery Fixes',
                        features: [
                          'User Auth (Login/Signup)',
                          'REST API & Database Integration',
                          'Improved Material 3 UI/UX',
                          'Supabase/Firebase Backend',
                        ],
                        isRecommended: true,
                        isDark: isDark,
                      ),
                      const SizedBox(height: 14),
                      _buildPricingCard(
                        title: 'Advanced App',
                        priceInr: '₹60,000 – ₹1,50,000+',
                        priceUsd: '\$750 – \$1,800+',
                        screens: '16–30+ Screens',
                        delivery: '3–5 Weeks',
                        revisions: 'Up to 5 Revisions',
                        support: '30 Days Priority Support',
                        features: [
                          'Full-Featured Architecture',
                          'Scalable Production Code',
                          'Premium UI/UX Animations',
                          'Priority Launch Support',
                        ],
                        isRecommended: false,
                        isDark: isDark,
                      ),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildPricingCard(
                              title: 'Basic App',
                              priceInr: '₹10,000 – ₹25,000',
                              priceUsd: '\$120 – \$300',
                              screens: '2–5 Screens',
                              delivery: '5–10 Days',
                              revisions: '1 Revision',
                              support: 'App Delivery Only',
                              features: [
                                'Clean & Responsive UI',
                                'Core Features',
                                'Signed APK/AAB Build',
                              ],
                              isRecommended: false,
                              isDark: isDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildPricingCard(
                              title: 'Standard App',
                              priceInr: '₹25,000 – ₹60,000',
                              priceUsd: '\$300 – \$750',
                              screens: '6–15 Screens',
                              delivery: '10–18 Days',
                              revisions: '2 Revisions',
                              support: '7 Days Bug Fixes',
                              features: [
                                'User Login & Auth',
                                'API & Database Setup',
                                'Improved M3 UI/UX',
                              ],
                              isRecommended: true,
                              isDark: isDark,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildPricingCard(
                              title: 'Advanced App',
                              priceInr: '₹60,000 – ₹1,50,000+',
                              priceUsd: '\$750 – \$1,800+',
                              screens: '16–30+ Screens',
                              delivery: '3–5 Weeks',
                              revisions: 'Up to 5 Revisions',
                              support: '30 Days Support',
                              features: [
                                'Scalable Architecture',
                                'Premium Animations',
                                'Priority Support',
                              ],
                              isRecommended: false,
                              isDark: isDark,
                            ),
                          ),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    // 6. 🌐 WEB ADMIN PANEL (OPTIONAL ADD-ON)
                    _buildAdminPanelCard(isDark, isMobile),

                    const SizedBox(height: 24),

                    // 7. ⚖️ PACKAGE COMPARISON TABLE
                    _buildSectionHeader(
                      title: 'Package Comparison',
                      icon: Icons.balance_rounded,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 10),
                    _buildComparisonTable(isDark, isMobile),

                    const SizedBox(height: 24),

                    // 8. ⏱️ DELIVERY TIMELINE & 🔄 REVISIONS POLICY
                    if (isMobile) ...[
                      _buildDeliveryTimelineCard(isDark),
                      const SizedBox(height: 16),
                      _buildRevisionsPolicyCard(isDark),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildDeliveryTimelineCard(isDark)),
                          const SizedBox(width: 14),
                          Expanded(child: _buildRevisionsPolicyCard(isDark)),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    // 9. 🛠️ SUPPORT & MAINTENANCE & 🚫 NOT INCLUDED
                    if (isMobile) ...[
                      _buildSupportCard(isDark),
                      const SizedBox(height: 16),
                      _buildNotIncludedCard(isDark),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildSupportCard(isDark)),
                          const SizedBox(width: 14),
                          Expanded(child: _buildNotIncludedCard(isDark)),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    // 10. 💳 PAYMENT TERMS & 🚀 MVP APPROACH
                    if (isMobile) ...[
                      _buildPaymentTermsCard(isDark),
                      const SizedBox(height: 16),
                      _buildMvpApproachCard(isDark),
                    ] else ...[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(child: _buildPaymentTermsCard(isDark)),
                          const SizedBox(width: 14),
                          Expanded(child: _buildMvpApproachCard(isDark)),
                        ],
                      ),
                    ],

                    const SizedBox(height: 24),

                    // 11. 🧮 INTERACTIVE PROJECT COST ESTIMATOR
                    _buildEstimatorSection(isDark, isMobile),

                    const SizedBox(height: 24),

                    // 12. 📌 TRUST NOTE & HORIZONTAL CTAS
                    _buildMainActions(isDark),

                    const SizedBox(height: 28),
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

  // HIGHLIGHTED SECTION HEADER HELPER
  Widget _buildSectionHeader({
    required String title,
    required IconData icon,
    required bool isDark,
    String? badgeText,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 6,
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, size: 16, color: AppTheme.primaryBlue),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        if (badgeText != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
            decoration: BoxDecoration(
              color: AppTheme.primaryBlue.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              badgeText,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryBlue,
              ),
            ),
          ),
      ],
    );
  }

  // 1. HEADER
  Widget _buildHeader(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: AppTheme.primaryBlue.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppTheme.primaryBlue.withValues(alpha: 0.3),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.rocket_launch_rounded,
                size: 12,
                color: AppTheme.primaryBlue,
              ),
              SizedBox(width: 5),
              Text(
                'Let\'s Build Your App',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryBlue,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '💼 Services & Pricing',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Clear starting estimates for building modern mobile applications and digital products.',
          style: TextStyle(
            fontSize: 12,
            color: isDark ? Colors.white60 : Colors.black54,
          ),
        ),
      ],
    );
  }

  // 2. 💰 HOW PRICING WORKS
  Widget _buildHowPricingWorksCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'How Pricing Works',
          icon: Icons.payments_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Estimates are based on total screen count, feature complexity, and API/database integrations.\n'
            '• All costs are discussed and finalized upfront before work begins — no hidden surprises.\n'
            '• Custom features or additional screens beyond standard scope are quoted transparently.',
            style: TextStyle(
              fontSize: 11,
              height: 1.5,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // 3. 💼 SERVICES OFFERED (WHAT I CAN BUILD)
  Widget _buildServicesGrid(bool isDark, bool isMobile) {
    final services = [
      {
        'icon': Icons.phone_android_rounded,
        'title': 'Full Stack App Development',
        'desc': 'Flutter cross-platform Android & iOS development.',
      },
      {
        'icon': Icons.palette_rounded,
        'title': 'Mobile App UI/UX Design',
        'desc': 'Material 3 Dark & Light responsive design.',
      },
      {
        'icon': Icons.cloud_done_rounded,
        'title': 'Backend Integration',
        'desc': 'Supabase, Firebase, REST APIs & Cloud Storage.',
      },
      {
        'icon': Icons.speed_rounded,
        'title': 'Performance Optimization',
        'desc': 'Smooth 60fps UI, lazy loading & clean code.',
      },
      {
        'icon': Icons.shop_rounded,
        'title': 'App Deployment & Launch',
        'desc': 'Signed APK/AAB builds & Google Play assistance.',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Services Offered',
          icon: Icons.build_circle_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: services.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: isMobile ? 1 : 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 58,
          ),
          itemBuilder: (context, index) {
            final service = services[index];
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: isDark ? AppTheme.darkSurface : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.08)
                      : Colors.black.withValues(alpha: 0.08),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBlue.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      service['icon'] as IconData,
                      size: 16,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          service['title'] as String,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        Text(
                          service['desc'] as String,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 10,
                            color: isDark ? Colors.white60 : Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  // 4. 📦 WHAT YOU GET INCLUDED
  Widget _buildWhatYouGetCard(bool isDark, bool isMobile) {
    final items = [
      {'icon': Icons.palette_outlined, 'title': 'Modern UI Design'},
      {'icon': Icons.devices_rounded, 'title': 'Responsive Layout'},
      {'icon': Icons.code_rounded, 'title': 'Clean Source Code'},
      {'icon': Icons.verified_rounded, 'title': 'Bug Free Setup'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'What You Get',
          icon: Icons.inventory_2_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Wrap(
            spacing: 16,
            runSpacing: 10,
            alignment: WrapAlignment.spaceAround,
            children: items.map((item) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    item['icon'] as IconData,
                    size: 15,
                    color: AppTheme.primaryBlue,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    item['title'] as String,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : Colors.black87,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  // PRICING CARD WIDGET
  Widget _buildPricingCard({
    required String title,
    required String priceInr,
    required String priceUsd,
    required String screens,
    required String delivery,
    required String revisions,
    required String support,
    required List<String> features,
    required bool isRecommended,
    required bool isDark,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isRecommended
              ? AppTheme.primaryBlue
              : (isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08)),
          width: isRecommended ? 2 : 1,
        ),
        boxShadow: isRecommended
            ? [
                BoxShadow(
                  color: AppTheme.primaryBlue.withValues(
                    alpha: isDark ? 0.15 : 0.08,
                  ),
                  blurRadius: 18,
                  spreadRadius: 1,
                ),
              ]
            : [
                BoxShadow(
                  color: isDark
                      ? Colors.black.withValues(alpha: 0.4)
                      : Colors.black.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isRecommended)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
              decoration: BoxDecoration(
                gradient: AppTheme.primaryGradient,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '⭐ Recommended Package',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),

          Text(
            title,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 3),

          Text(
            priceInr,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: AppTheme.primaryBlue,
            ),
          ),
          Text(
            '($priceUsd)',
            style: TextStyle(
              fontSize: 10,
              color: isDark ? Colors.white54 : Colors.black45,
            ),
          ),
          const SizedBox(height: 10),

          const Divider(height: 1),
          const SizedBox(height: 10),

          _buildSpecRow(Icons.splitscreen_rounded, 'Screens', screens, isDark),
          _buildSpecRow(Icons.schedule_rounded, 'Delivery', delivery, isDark),
          _buildSpecRow(Icons.sync_rounded, 'Revisions', revisions, isDark),
          _buildSpecRow(
            Icons.support_agent_rounded,
            'Support',
            support,
            isDark,
          ),

          const SizedBox(height: 10),
          const Divider(height: 1),
          const SizedBox(height: 10),

          Text(
            'Included Features:',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
          const SizedBox(height: 5),
          Column(
            children: features.map((feature) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      size: 13,
                      color: AppTheme.primaryBlue,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        feature,
                        style: TextStyle(
                          fontSize: 11,
                          color: isDark ? Colors.white70 : Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 14),

          SizedBox(
            width: double.infinity,
            child: isRecommended
                ? ElevatedButton(
                    onPressed: () => _openProjectInquiry(
                      packageTitle: title,
                      estimatedPrice: priceInr,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryBlue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Select Package →'),
                  )
                : OutlinedButton(
                    onPressed: () => _openProjectInquiry(
                      packageTitle: title,
                      estimatedPrice: priceInr,
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppTheme.primaryBlue,
                      side: const BorderSide(color: AppTheme.primaryBlue),
                      padding: const EdgeInsets.symmetric(vertical: 9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text('Select Package →'),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpecRow(IconData icon, String label, String value, bool isDark) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 12, color: AppTheme.primaryBlue),
              const SizedBox(width: 5),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  // 6. 🌐 WEB ADMIN PANEL CARD
  Widget _buildAdminPanelCard(bool isDark, bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Web Admin Panel',
          icon: Icons.dashboard_customize_rounded,
          isDark: isDark,
          badgeText: 'Optional Add-On',
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDark ? AppTheme.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppTheme.secondaryPurple.withValues(alpha: 0.3),
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
                child: const Icon(
                  Icons.dashboard_customize_rounded,
                  color: AppTheme.secondaryPurple,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '₹25,000 – ₹60,000 (\$300 – \$750)',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.secondaryPurple,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Manage app data, user profiles, content, and analytics directly from a secure web dashboard.\n'
                      '👉 Optional add-on — required only if you need a custom control panel.',
                      style: TextStyle(
                        fontSize: 10,
                        height: 1.4,
                        color: isDark ? Colors.white60 : Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: const [
                        Chip(
                          label: Text('🔑 Admin Auth'),
                          visualDensity: VisualDensity.compact,
                        ),
                        Chip(
                          label: Text('👥 User Control'),
                          visualDensity: VisualDensity.compact,
                        ),
                        Chip(
                          label: Text('📝 Content Manager'),
                          visualDensity: VisualDensity.compact,
                        ),
                        Chip(
                          label: Text('📊 Analytics Dashboard'),
                          visualDensity: VisualDensity.compact,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 7. ⚖️ PACKAGE COMPARISON TABLE
  Widget _buildComparisonTable(bool isDark, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isDark ? AppTheme.darkSurface : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.black.withValues(alpha: 0.08),
        ),
      ),
      child: Column(
        children: [
          _buildTableRow(
            'Feature',
            'Basic',
            'Standard',
            'Advanced',
            isHeader: true,
            isDark: isDark,
          ),
          const Divider(height: 10),
          _buildTableRow(
            'UI Screens',
            '2–5',
            '6–15',
            '16+ Screens',
            isDark: isDark,
          ),
          _buildTableRow(
            'UI/UX Quality',
            'Basic M3',
            'Improved M3',
            'Premium Custom',
            isDark: isDark,
          ),
          _buildTableRow('User Auth', '❌', '✅', '✅', isDark: isDark),
          _buildTableRow('API Integration', '❌', '✅', '✅', isDark: isDark),
          _buildTableRow('Database Setup', '❌', '✅', '✅', isDark: isDark),
          _buildTableRow(
            'Delivery Time',
            '5–10 Days',
            '10–18 Days',
            '3–5 Weeks',
            isDark: isDark,
          ),
          _buildTableRow(
            'Revisions',
            '1 Revision',
            '2 Revisions',
            'Up to 5',
            isDark: isDark,
          ),
          _buildTableRow(
            'Support',
            'Delivery Only',
            '7 Days Fixes',
            '30 Days Priority',
            isDark: isDark,
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(
    String col1,
    String col2,
    String col3,
    String col4, {
    bool isHeader = false,
    required bool isDark,
  }) {
    final style = TextStyle(
      fontSize: isHeader ? 11 : 10,
      fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
      color: isHeader
          ? AppTheme.primaryBlue
          : (isDark ? Colors.white70 : Colors.black87),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text(col1, overflow: TextOverflow.ellipsis, style: style),
          ),
          Expanded(
            flex: 2,
            child: Text(
              col2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              col3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              col4,
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ),
        ],
      ),
    );
  }

  // 8. ⏱️ DELIVERY TIMELINE & 🔄 REVISIONS POLICY
  Widget _buildDeliveryTimelineCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Delivery Timeline',
          icon: Icons.schedule_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Basic App: 5–10 Days (2–4 days for simple UI)\n'
            '• Standard App: 10–18 Days (5–10 days core)\n'
            '• Advanced App: 3–5 Weeks (10–20 days core)\n'
            '📌 Delivery time may vary depending on prompt feedback & requirements.',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRevisionsPolicyCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Revisions Policy',
          icon: Icons.sync_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Basic App: 1 Revision\n'
            '• Standard App: 2 Revisions\n'
            '• Advanced App: Up to 5 Minor Revisions\n'
            '📌 Revisions cover layout tweaks, color adjustments & minor bug fixes within initial scope.',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // 9. 🛠️ SUPPORT & MAINTENANCE & 🚫 NOT INCLUDED
  Widget _buildSupportCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Support & Maintenance',
          icon: Icons.support_agent_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Basic: App delivery only\n'
            '• Standard: 7 Days minor bug fixes post-launch\n'
            '• Advanced: 30 Days full launch support + minor updates (Recommended)\n'
            '• Optional: Monthly Support (₹5k–₹10k/month) for ongoing updates & maintenance.',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNotIncludedCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Not Included in Base Price',
          icon: Icons.block_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Hosting & Server Costs (AWS, Vercel, Supabase paid tiers)\n'
            '• Google Play Store & Apple App Store Developer Account Fees (\$25 / \$99)\n'
            '• Paid Third-Party APIs or SMS Gateways (Twilio, Razorpay gateway fees)',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // 10. 💳 PAYMENT TERMS & 🚀 MVP APPROACH
  Widget _buildPaymentTermsCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Payment Terms',
          icon: Icons.credit_card_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• 50% Advance payment to begin development\n'
            '• 50% Remaining payment upon final delivery & verification\n'
            '• Accepted via UPI / Direct Bank Transfer\n'
            '📌 Payments are non-refundable once development actively begins.',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMvpApproachCard(bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Development Approach (MVP)',
          icon: Icons.rocket_launch_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
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
          child: Text(
            '• Phase 1 (MVP): Build core features for fast initial launch\n'
            '• Post-Delivery: Review & client feedback\n'
            '• Phase 2 (Optional): Add payment gateways, custom scaling, admin panel & analytics',
            style: TextStyle(
              fontSize: 11,
              height: 1.4,
              color: isDark ? Colors.white70 : Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  // 11. 🧮 INTERACTIVE PROJECT COST ESTIMATOR (SYNCHRONIZED TIER & SCREENS)
  Widget _buildEstimatorSection(bool isDark, bool isMobile) {
    final tiers = [
      {'name': 'Basic App', 'screens': '2–5 Screens'},
      {'name': 'Standard App', 'screens': '6–15 Screens'},
      {'name': 'Advanced App', 'screens': '16–30+ Screens'},
      {'name': 'App + Admin Panel', 'screens': '6–30+ Screens'},
    ];

    String getCalculatedPrice() {
      if (_selectedTierIndex == 0) {
        return '₹10,000 – ₹25,000 (\$120 – \$300)';
      } else if (_selectedTierIndex == 1) {
        return '₹25,000 – ₹60,000 (\$300 – \$750)';
      } else if (_selectedTierIndex == 2) {
        return '₹60,000 – ₹1,50,000+ (\$750 – \$1,800+)';
      } else {
        // App + Admin Panel
        if (_selectedScreenIndex == 0) {
          return '₹35,000 – ₹60,000 (\$420 – \$750)';
        } else if (_selectedScreenIndex == 1) {
          return '₹50,000 – ₹1,10,000 (\$600 – \$1,350)';
        } else {
          return '₹85,000 – ₹2,10,000+ (\$1,050 – \$2,550+)';
        }
      }
    }

    final calculatedPrice = getCalculatedPrice();
    final selectedTierName = tiers[_selectedTierIndex]['name']!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(
          title: 'Project Cost Estimator',
          icon: Icons.calculate_rounded,
          isDark: isDark,
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppTheme.primaryBlue.withValues(alpha: isDark ? 0.15 : 0.06),
                AppTheme.secondaryPurple.withValues(
                  alpha: isDark ? 0.15 : 0.06,
                ),
              ],
            ),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppTheme.primaryBlue.withValues(alpha: 0.3),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select your desired requirements to estimate package & starting costs:',
                style: TextStyle(
                  fontSize: 11,
                  color: isDark ? Colors.white60 : Colors.black54,
                ),
              ),
              const SizedBox(height: 10),

              Text(
                'Step 1: Select App Type',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: List.generate(tiers.length, (index) {
                  final selected = _selectedTierIndex == index;
                  return ChoiceChip(
                    label: Text(tiers[index]['name']!),
                    selected: selected,
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _selectedTierIndex = index;
                          // Synchronize screen index based on selected App Tier
                          if (index == 0) {
                            _selectedScreenIndex = 0; // 2-5 screens
                          } else if (index == 1) {
                            _selectedScreenIndex = 1; // 6-15 screens
                          } else if (index == 2) {
                            _selectedScreenIndex = 2; // 16-30+ screens
                          } else if (index == 3 && _selectedScreenIndex == 0) {
                            _selectedScreenIndex =
                                1; // 6-15 screens default for Admin Panel
                          }
                        });
                      }
                    },
                    selectedColor: AppTheme.primaryBlue,
                    labelStyle: TextStyle(
                      fontSize: 10,
                      color: selected
                          ? Colors.white
                          : (isDark ? Colors.white70 : Colors.black87),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),

              Text(
                'Step 2: Estimated Screens',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white70 : Colors.black87,
                ),
              ),
              const SizedBox(height: 5),
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: List.generate(screenRanges.length, (index) {
                  final selected = _selectedScreenIndex == index;
                  return ChoiceChip(
                    label: Text(screenRanges[index]),
                    selected: selected,
                    onSelected: (val) {
                      if (val) {
                        setState(() {
                          _selectedScreenIndex = index;
                          // Synchronize tier index based on selected Screen Range
                          if (index == 0 && _selectedTierIndex != 3) {
                            _selectedTierIndex = 0; // Basic App
                          } else if (index == 1 && _selectedTierIndex == 0) {
                            _selectedTierIndex = 1; // Standard App
                          } else if (index == 2 &&
                              (_selectedTierIndex == 0 ||
                                  _selectedTierIndex == 1)) {
                            _selectedTierIndex = 2; // Advanced App
                          }
                        });
                      }
                    },
                    selectedColor: AppTheme.primaryBlue,
                    labelStyle: TextStyle(
                      fontSize: 10,
                      color: selected
                          ? Colors.white
                          : (isDark ? Colors.white70 : Colors.black87),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 14),

              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDark ? AppTheme.darkSurface : Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppTheme.primaryBlue.withValues(alpha: 0.3),
                  ),
                ),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Estimated Price:',
                          style: TextStyle(
                            fontSize: 9,
                            color: isDark ? Colors.white54 : Colors.black45,
                          ),
                        ),
                        Text(
                          calculatedPrice,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w800,
                            color: AppTheme.primaryBlue,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton.icon(
                      onPressed: () => _openProjectInquiry(
                        packageTitle: selectedTierName,
                        estimatedPrice: calculatedPrice,
                      ),
                      icon: const Icon(Icons.send_rounded, size: 12),
                      label: const Text('Start Project →'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 7,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // 12. 📌 TRUST NOTE & HORIZONTAL ACTION BUTTONS
  Widget _buildMainActions(bool isDark) {
    return Column(
      children: [
        Text(
          '📌 Final pricing and timeline depend on project requirements, complexity, integrations, and revisions.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            color: isDark ? Colors.white54 : Colors.black45,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 14),

        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                label: 'Start Project',
                icon: Icons.rocket_launch_rounded,
                isPrimary: true,
                isDark: isDark,
                onTap: () => _openProjectInquiry(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildActionButton(
                label: 'WhatsApp Chat',
                icon: Icons.chat_rounded,
                isPrimary: false,
                isDark: isDark,
                onTap: () => _launchWhatsApp(
                  '👋 Hi Sagar, I would like to chat about your app development services.',
                ),
              ),
            ),
          ],
        ),
      ],
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
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: isPrimary
                    ? Colors.white
                    : (isDark ? Colors.white : Colors.black87),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              icon,
              size: 14,
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
