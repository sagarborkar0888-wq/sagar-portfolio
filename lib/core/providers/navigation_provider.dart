import 'package:flutter_riverpod/flutter_riverpod.dart';

enum NavigationSection {
  home('Home'),
  about('About'),
  skills('Skills'),
  journey('Journey'),
  projects('Projects'),
  services('Services'),
  contact('Contact');

  final String label;
  const NavigationSection(this.label);
}

final activeSectionProvider = StateProvider<NavigationSection>((ref) {
  return NavigationSection.home;
});
