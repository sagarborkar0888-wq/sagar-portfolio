import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      appBar: AppBar(
        title: const Text("Privacy Policy"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        children: [
          UiHelper.verticalLine(left: 25),

          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                UiHelper.verticalSpace(20),

                /// 🔹 Introduction
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Introduction",
                    items: [
                      "This policy applies to all users of this platform.",
                      "We respect your privacy and protect your data.",
                      "This policy explains how we collect, use, and protect your information."
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Data Collection
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Data We Collect",
                    items: [
                      "Name and email address",
                      "Phone number (if provided)",
                      "Profile picture",
                      "Device and usage data",
                      "Location (if provided)",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 How Data is Used
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "How We Use Data",
                    items: [
                      "improve platform performance",
                      "Personalize user experience",
                      "Provide better features",
                      "Ensure security and prevent fraud",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Data Sharing
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Data Sharing",
                    items: [
                      "We do not sell your personal data",
                      "We use trusted third-party services to operate and improve the platform.",
                      "Data is shared only to improve platform functionality",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Payments
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Payments",
                    items: [
                      "We may use third-party payment services",
                      "We do not store your payment details",
                      "All payments are securely processed",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Data Security
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Data Security",
                    items: [
                      "We use secure methods to protect your data",
                      "Your data is protected using standard security practices",
                      "We continuously improve our security systems",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Data Retention
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Data Retention",
                    items: [
                      "We keep your data only as long as needed",
                      "You can request data deletion anytime",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Cookies / Tracking
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Cookies & Tracking",
                    items: [
                      "We may use cookies and analytics tools",
                      "This helps improve user experience",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 User Rights
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Your Rights",
                    items: [
                      "Access your data",
                      "Request correction",
                      "Request deletion",
                      "Withdraw consent anytime",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(16),

                /// 🔹 Contact Information
                UiHelper.fadeSlideSection(
                  child: UiHelper.sectionCard(
                    title: "Contact Information",
                    items: [
                      "Developer: Sagar Borkar",
                      "Email: sagarborkar0888@email.com",
                      "Phone: +91 8788357452",
                      "Location: India",
                    ],
                  ),
                ),

                UiHelper.verticalSpace(30),

                /// 🔹 Contact Button
                UiHelper.glassButton(
                  text: "Contact Us",
                  onTap: () {
                    UiHelper.launchUrlLink("https://wa.me/918788357452");
                  },
                ),

                UiHelper.verticalSpace(30),
              ],
            ),
          ),
        ],
      ),
    );
  }
}