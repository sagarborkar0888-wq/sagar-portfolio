import 'package:flutter/material.dart';
import '../helpers/ui_helper.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({super.key});

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  String selectedFilter = "All";

  final List<Map<String, dynamic>> skills = const [
    {'name': 'Mobile App Development', 'percent': 0.9, 'category': 'Frontend'},
    {'name': 'App Logic & Architecture', 'percent': 0.85, 'category': 'Frontend'},
    {'name': 'Backend Integration', 'percent': 0.7, 'category': 'Backend'},
    {'name': 'Database Management', 'percent': 0.75, 'category': 'Backend'},
    {'name': 'UI/UX Design', 'percent': 0.8, 'category': 'Tools'},
  ];

  List<Map<String, dynamic>> get filteredSkills {
    if (selectedFilter == "All") return skills;
    return skills.where((s) => s['category'] == selectedFilter).toList();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Skills 🚀"),
        centerTitle: true,
      ),

      body: Stack(
        children: [

          /// 🔥 BACKGROUND GRADIENT (FUTURE LOOK)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.black87],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          /// 🔥 MAIN CONTENT
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// 🔥 HEADER
                UiHelper.fadeSlideSection(
                  child: const Text(
                    "My Skills 💡",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                UiHelper.verticalSpace(8),

                UiHelper.fadeSlideSection(
                  child: const Text(
                    "Building scalable apps with modern technologies.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                UiHelper.verticalSpace(20),

                /// 🔥 FILTER CHIPS
                UiHelper.fadeSlideSection(
                  child: Wrap(
                    spacing: 10,
                    children: [
                      UiHelper.chipButton(
                        text: "All",
                        isSelected: selectedFilter == "All",
                        onTap: () => setState(() => selectedFilter = "All"),
                      ),
                      UiHelper.chipButton(
                        text: "Frontend",
                        isSelected: selectedFilter == "Frontend",
                        onTap: () =>
                            setState(() => selectedFilter = "Frontend"),
                      ),
                      UiHelper.chipButton(
                        text: "Backend",
                        isSelected: selectedFilter == "Backend",
                        onTap: () =>
                            setState(() => selectedFilter = "Backend"),
                      ),
                      UiHelper.chipButton(
                        text: "Tools",
                        isSelected: selectedFilter == "Tools",
                        onTap: () =>
                            setState(() => selectedFilter = "Tools"),
                      ),
                    ],
                  ),
                ),

                UiHelper.verticalSpace(25),

                /// 🔥 SKILLS GRID (PREMIUM CARDS)
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredSkills.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: width < 600 ? 1 : 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    childAspectRatio: 3,
                  ),
                  itemBuilder: (context, index) {
                    final skill = filteredSkills[index];

                    return UiHelper.animatedCard(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white24),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.15),
                              blurRadius: 15,
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            /// 🔥 TOP ROW
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  skill['name'],
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                Text(
                                  "${(skill['percent'] * 100).toInt()}%",
                                  style: const TextStyle(
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            UiHelper.verticalSpace(6),

                            /// 🔥 CATEGORY TAG
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                skill['category'],
                                style: const TextStyle(fontSize: 10),
                              ),
                            ),

                            UiHelper.verticalSpace(10),

                            /// 🔥 ANIMATED PROGRESS
                            UiHelper.animatedProgressBar(
                              percent: skill['percent'],
                              width: double.infinity,
                              height: 8,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                UiHelper.verticalSpace(30),

                /// 🔥 PREMIUM SECTION (HIGH CONVERSION)
                UiHelper.fadeSlideSection(
                  child: Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white24),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text(
                          "🚀 Work With Me",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        UiHelper.verticalSpace(10),

                        const Text(
                          "I build high-performance Flutter apps with clean UI, smooth animations, and scalable architecture.",
                          style: TextStyle(height: 1.4),
                        ),

                        UiHelper.verticalSpace(15),

                        /// 🔥 BUTTONS
                        Row(
                          children: [
                            Expanded(
                              child: UiHelper.glowButton(
                                text: "Contact",
                                onTap: () {
                                  UiHelper.launchUrlLink(
                                      "https://wa.me/918788357452?text=Hi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20would%20like%20to%20connect%20with%20you.%0A%0ACan%20we%20talk%3F%20😊"
                                  );
                                },
                              ),
                            ),

                            UiHelper.horizontalSpace(10),

                            Expanded(
                              child: UiHelper.glowButton(
                                text: "Start Project",
                                onTap: () {
                                  UiHelper.launchUrlLink(
                                      "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%"
                                          "20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Featur"
                                          "es%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20"
                                          "or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you."
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                UiHelper.verticalSpace(40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}