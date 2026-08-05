import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../helpers/ui_helper.dart';
import '../widgets/contact/contact_action_bar.dart';
import '../widgets/contact/contact_availability_card.dart';
import '../widgets/contact/contact_featured_project_card.dart';
import '../widgets/contact/contact_form_card.dart';
import '../widgets/contact/contact_hero.dart';
import '../widgets/contact/contact_info_card.dart';
import '../widgets/contact/contact_primary_cta.dart';
import '../widgets/contact/contact_services_grid.dart';
import '../widgets/contact/contact_workflow_card.dart';
import '../widgets/scroll_progress_indicator.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection>
    with AutomaticKeepAliveClientMixin {
  final _formKey = GlobalKey<FormState>();
  final _scrollController = ScrollController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool _isSubmitting = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    _scrollController.dispose();
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

  void _submitFormToWhatsApp() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      UiHelper.showSnackbar(context, 'Please fill all required fields');
      return;
    }

    setState(() => _isSubmitting = true);

    final message =
        '''
👋 *New Project Inquiry*

👤 Name: ${nameController.text.trim()}
📧 Email: ${emailController.text.trim()}

💬 Message:
${messageController.text.trim()}

---
Sent from Portfolio App 🚀
''';

    final url =
        "https://wa.me/918788357452?text=${Uri.encodeComponent(message)}";

    await Future.delayed(const Duration(milliseconds: 300));
    if (mounted) {
      setState(() => _isSubmitting = false);
    }
    _launch(url);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
          "Contact",
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
                    // 1. HERO HEADER
                    ContactHero(isDark: isDark),
                    const SizedBox(height: 28),

                    // 2. RESPONSIVE ADAPTIVE LAYOUT
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final width = constraints.maxWidth;

                        if (width >= 1080) {
                          // Desktop / Ultra-wide 2-Column
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 11,
                                child: Column(
                                  children: [
                                    ContactInfoCard(
                                      isDark: isDark,
                                      onLaunch: _launch,
                                    ),
                                    const SizedBox(height: 20),
                                    ContactServicesGrid(isDark: isDark),
                                    const SizedBox(height: 20),
                                    ContactFeaturedProjectCard(
                                      isDark: isDark,
                                      onLaunch: _launch,
                                    ),
                                    const SizedBox(height: 20),
                                    ContactAvailabilityCard(isDark: isDark),
                                    const SizedBox(height: 20),
                                    ContactWorkflowCard(isDark: isDark),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 24),
                              Expanded(
                                flex: 10,
                                child: Column(
                                  children: [
                                    ContactFormCard(
                                      isDark: isDark,
                                      formKey: _formKey,
                                      nameController: nameController,
                                      emailController: emailController,
                                      messageController: messageController,
                                      isSubmitting: _isSubmitting,
                                      onSubmit: _submitFormToWhatsApp,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else if (width >= 720) {
                          // Tablet Balanced 2-Column
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    ContactInfoCard(
                                      isDark: isDark,
                                      onLaunch: _launch,
                                    ),
                                    const SizedBox(height: 20),
                                    ContactServicesGrid(isDark: isDark),
                                    const SizedBox(height: 20),
                                    ContactFeaturedProjectCard(
                                      isDark: isDark,
                                      onLaunch: _launch,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    ContactFormCard(
                                      isDark: isDark,
                                      formKey: _formKey,
                                      nameController: nameController,
                                      emailController: emailController,
                                      messageController: messageController,
                                      isSubmitting: _isSubmitting,
                                      onSubmit: _submitFormToWhatsApp,
                                    ),
                                    const SizedBox(height: 20),
                                    ContactAvailabilityCard(isDark: isDark),
                                    const SizedBox(height: 20),
                                    ContactWorkflowCard(isDark: isDark),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Mobile Single Column Stack
                          return Column(
                            children: [
                              ContactInfoCard(
                                isDark: isDark,
                                onLaunch: _launch,
                              ),
                              const SizedBox(height: 20),
                              ContactServicesGrid(isDark: isDark),
                              const SizedBox(height: 20),
                              ContactFeaturedProjectCard(
                                isDark: isDark,
                                onLaunch: _launch,
                              ),
                              const SizedBox(height: 20),
                              ContactAvailabilityCard(isDark: isDark),
                              const SizedBox(height: 20),
                              ContactWorkflowCard(isDark: isDark),
                              const SizedBox(height: 24),
                              ContactFormCard(
                                isDark: isDark,
                                formKey: _formKey,
                                nameController: nameController,
                                emailController: emailController,
                                messageController: messageController,
                                isSubmitting: _isSubmitting,
                                onSubmit: _submitFormToWhatsApp,
                              ),
                            ],
                          );
                        }
                      },
                    ),

                    const SizedBox(height: 28),

                    // 3. QUICK CONTACT ACTIONS BAR
                    ContactActionBar(isDark: isDark, onLaunch: _launch),
                    const SizedBox(height: 28),

                    // 4. PRIMARY CTA AREA
                    ContactPrimaryCta(isDark: isDark, onLaunch: _launch),
                    const SizedBox(height: 24),

                    // 5. RESPONSE TIME FOOTER
                    Center(
                      child: Text(
                        "⏳ Usually respond within 24 hours",
                        style: TextStyle(
                          color: isDark
                              ? Colors.white54
                              : const Color(0xFF64748B),
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),

          // PINNED VERTICAL SCROLL PROGRESS BAR
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
