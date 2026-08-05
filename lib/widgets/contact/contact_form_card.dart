import 'package:flutter/material.dart';

class ContactFormCard extends StatelessWidget {
  final bool isDark;
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController messageController;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  const ContactFormCard({
    super.key,
    required this.isDark,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.messageController,
    required this.isSubmitting,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    final cardBg = isDark ? const Color(0xFF131622) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white60 : const Color(0xFF475569);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: isDark
                ? const Color(0xFF3B82F6).withValues(alpha: 0.12)
                : Colors.black.withValues(alpha: 0.06),
            blurRadius: 24,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.rocket_launch,
                  color: Color(0xFF2563EB),
                  size: 22,
                ),
                const SizedBox(width: 8),
                Text(
                  "Start Your Project",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              "Send your project details directly to my WhatsApp.",
              style: TextStyle(color: subTextColor, fontSize: 12.5),
            ),
            const SizedBox(height: 16),

            // Name Field
            TextFormField(
              controller: nameController,
              style: TextStyle(color: textColor, fontSize: 13.5),
              textInputAction: TextInputAction.next,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
              decoration: _buildInputDecoration(
                "Your Name",
                Icons.person_outline,
              ),
            ),
            const SizedBox(height: 14),

            // Email Field
            TextFormField(
              controller: emailController,
              style: TextStyle(color: textColor, fontSize: 13.5),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your email';
                }
                if (!val.contains('@') || !val.contains('.')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
              decoration: _buildInputDecoration(
                "Your Email",
                Icons.mail_outline,
              ),
            ),
            const SizedBox(height: 14),

            // Message Field
            TextFormField(
              controller: messageController,
              style: TextStyle(color: textColor, fontSize: 13.5),
              maxLines: 4,
              textInputAction: TextInputAction.done,
              validator: (val) {
                if (val == null || val.trim().isEmpty) {
                  return 'Please enter your message';
                }
                return null;
              },
              decoration: _buildInputDecoration(
                "Your Message",
                Icons.chat_bubble_outline,
              ),
            ),
            const SizedBox(height: 20),

            // Primary WhatsApp CTA Button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: isSubmitting ? null : onSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF25D366),
                  foregroundColor: Colors.white,
                  elevation: 4,
                  shadowColor: const Color(0xFF25D366).withValues(alpha: 0.3),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      )
                    : const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.chat_bubble_rounded, size: 18),
                          SizedBox(width: 8),
                          Text(
                            "Start Project on WhatsApp 🚀",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.2,
                            ),
                          ),
                        ],
                      ),
              ),
            ),

            const SizedBox(height: 14),

            // Trust Card
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.04)
                    : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isDark
                      ? Colors.white.withValues(alpha: 0.06)
                      : Colors.black.withValues(alpha: 0.05),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    "⚡ Production-ready applications",
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "💎 Focused on quality, performance & user experience",
                    style: TextStyle(color: subTextColor, fontSize: 11.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _buildInputDecoration(String hintText, IconData icon) {
    final subTextColor = isDark ? Colors.white38 : const Color(0xFF94A3B8);

    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: subTextColor, fontSize: 13),
      prefixIcon: Icon(icon, color: const Color(0xFF2563EB), size: 18),
      filled: true,
      fillColor: isDark
          ? Colors.white.withValues(alpha: 0.05)
          : const Color(0xFFF8FAFC),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: isDark
              ? Colors.white.withValues(alpha: 0.1)
              : Colors.black.withValues(alpha: 0.1),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFF3B82F6), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.redAccent, width: 1.5),
      ),
    );
  }
}
