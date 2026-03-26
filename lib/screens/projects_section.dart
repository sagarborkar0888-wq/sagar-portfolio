import 'package:flutter/material.dart';
import 'package:sagar_borkar_tech/helpers/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  final List<Map<String, dynamic>> projects = const [
    {
      'title': 'SocialProX',
      'image': 'assets/images/premium_futuristic_S_transparent.png', // ✅ changed
      'description': 'A cross-platform social media app with chat, posts & real-time features.',
      'tech': ['Flutter', 'Supabase'],
      'link': 'https://play.google.com/store/apps/details?id=socialprox'
    },
    {
      'title': 'Portfolio App',
      'image': 'assets/images/portfolio.png', // ✅ changed
      'description': 'Personal portfolio showcasing projects and skills.',
      'tech': ['Flutter'],
      'link': 'https://github.com/sagar'
    },
  ];

  // Launch URL
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Projects')),

      body: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount = constraints.maxWidth < 600 ? 2 : 3;

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: projects.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.5, // balanced for all devices
            ),
            itemBuilder: (context, index) {
              final project = projects[index];

              return UiHelper.animatedCard(
                child: GestureDetector(
                  onTap: () => _launchURL(project['link']),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ✅ Image
                        SizedBox(
                          width: double.infinity,
                          child: AspectRatio(
                            aspectRatio: 1, // 🔥 Square (1:1)
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                project['image'],
                                fit: BoxFit.cover, // 🔥 fills square properly
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons.broken_image, color: Colors.grey),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 6),

                        // ✅ Title
                        Text(
                          project['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),

                        const SizedBox(height: 4),

                        // ✅ Description
                        Text(
                          project['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 11),
                        ),

                        const SizedBox(height: 4),

                        // ✅ Chips (compact)
                        Wrap(
                          spacing: 4,
                          children: (project['tech'] as List<String>)
                              .map((tech) => Chip(
                            label: Text(
                              tech,
                              style: const TextStyle(fontSize: 8),
                            ),
                            padding: EdgeInsets.zero,
                            materialTapTargetSize:
                            MaterialTapTargetSize.shrinkWrap,
                          ))
                              .toList(),
                        ),

                        const SizedBox(height: 4),

                        // ✅ Button
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () => _launchURL(project['link']),
                            child: const Text('View', style: TextStyle(fontSize: 12)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}