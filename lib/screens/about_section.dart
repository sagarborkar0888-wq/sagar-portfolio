import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';
import 'contact_section.dart';
import 'projects_section.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text('About Me', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            /// 🔥 PROFILE CARD
            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [

                    /// 🔥 PROFILE IMAGE
                    Container(
                      width: 110, // 2*radius = 55*2
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 20,
                            spreadRadius: 2,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage('assets/images/sagar_borkar.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    UiHelper.verticalSpace(15),

                    /// NAME
                    UiHelper.scrollAnimation(
                      child: const Text(
                        'Sagar Borkar',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    UiHelper.verticalSpace(5),

                    const Text(
                      'Application Developer / Android Developer Full Stack App Developer',
                      style: TextStyle(color: Colors.white70),
                      textAlign: TextAlign.center,
                    ),

                    UiHelper.verticalSpace(5),

                    const Text(
                      'Founder & Developer of SocialProX',
                      style: TextStyle(
                        color: Colors.white60,
                        fontStyle: FontStyle.italic,
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 ABOUT CARD
            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: UiHelper.scrollAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'I am a Fulll Stack App developer focused on building high-quality, responsive, and scalable applications.',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'I specialize in creating real-world apps with clean UI, smooth performance, and production-ready architecture.',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'My goal is to build apps that not only work but also create impact and generate income.',
                        style: TextStyle(
                          color: isDark ? Colors.white70 : Colors.black87,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            UiHelper.verticalSpace(20),

            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: UiHelper.scrollAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "🎯 My Mission",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text("• Build apps that solve real problems"),
                      Text("• Create scalable digital products"),
                      Text("• Achieve financial freedom through apps"),
                    ],
                  ),
                ),
              ),
            ),

            UiHelper.verticalSpace(25),

            /// 🔥 EXPERIENCE CARD
            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: UiHelper.scrollAnimation(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('💼 Experience',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                  
                      SizedBox(height: 10),
                  
                      Text('• Developed real-world mobile applications'),
                      Text('• Integrated backend systems (Supabase, APIs)'),
                      Text('• Designed modern and responsive UI/UX'),
                      Text('• Play Store deployment'),
                    ],
                  ),
                ),
              ),
            ),

            UiHelper.verticalSpace(25),

            const Text(
              "⚡ Skills & Technologies",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            UiHelper.verticalSpace(20),

            /// 🔥 SKILLS (Premium Chips)
            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: UiHelper.scrollAnimation(
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: const [
                      Chip(label: Text('Flutter')),
                      Chip(label: Text('Dart')),
                      Chip(label: Text('Supabase')),
                      Chip(label: Text('Firebase')),
                      Chip(label: Text('Cloudinary')),
                      Chip(label: Text('REST APIs')),
                      Chip(label: Text('UI/UX')),
                    ],
                  ),
                ),
              ),
            ),

            UiHelper.verticalSpace(25),

            const Text(
              "🎯 Interests",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            UiHelper.verticalSpace(20),

            /// 🔥 HOBBIES
            UiHelper.fadeSlideSection(
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: UiHelper.scrollAnimation(
                  child: Wrap(
                    spacing: 10,
                    children: const [
                      Chip(label: Text('Gym')),
                      Chip(label: Text('Tech')),
                      Chip(label: Text('Gaming')),
                      Chip(label: Text('Travel')),
                    ],
                  ),
                ),
              ),
            ),

            UiHelper.verticalSpace(30),

            /// 🔥 CTA BUTTONS (Premium Style)
            Column(
              children: [

                UiHelper.glowButton(
                  text: "Email Me ✉️",
                  onTap: () =>
                      UiHelper.launchUrlLink('mailto:sagarborkar0888@example.com'),
                ),

                UiHelper.verticalSpace(15),

                UiHelper.glowButton(
                  text: "LinkedIn 🔗",
                  onTap: () =>
                      UiHelper.launchUrlLink('https://www.linkedin.com/in/sagar-borkar-724ba7315?utm_source='
                          'share&utm_campaign=share_via&utm_content=profile&utm_medium=android_app'),
                ),

                UiHelper.verticalSpace(15),

                UiHelper.glowButton(
                  text: "GitHub 💻",
                  onTap: () =>
                      UiHelper.launchUrlLink('https://github.com/sagarborkar0888-wq'),
                ),

                UiHelper.verticalSpace(15),

                UiHelper.glowButton(
                  text: "Contact Me 📞",
                  onTap: () =>
                      UiHelper.navigateWithSlideTransition(context, const ContactSection()),
                ),

                UiHelper.verticalSpace(15),

                UiHelper.glowButton(
                  text: "View My Work 💼",
                  onTap: () => UiHelper.navigateWithSlideTransition(context, const ProjectsSection()),
                ),
              ],
            ),

            UiHelper.verticalSpace(25),

            Text(
              "🚀 Available for freelance & collaborations",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 5),

            Text(
              "⏳ Response within 24 hours",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white54),
            ),
          ],
        ),
      ),
    );
  }
}