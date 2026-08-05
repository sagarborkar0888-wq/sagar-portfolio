import 'package:flutter/material.dart';

class ContactPrimaryCta extends StatelessWidget {
  final bool isDark;
  final Function(String) onLaunch;

  const ContactPrimaryCta({
    super.key,
    required this.isDark,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);
    final subTextColor = isDark ? Colors.white70 : const Color(0xFF475569);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  const Color(0xFF1E1B4B).withValues(alpha: 0.6),
                  const Color(0xFF0F172A).withValues(alpha: 0.8),
                ]
              : [const Color(0xFFEFF6FF), const Color(0xFFF3E8FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color(0xFF8B5CF6).withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            "Ready to Build Something?",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "Let's turn your idea into a real application.",
            style: TextStyle(color: subTextColor, fontSize: 13.5),
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 12,
            runSpacing: 10,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () => onLaunch(
                  "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Features%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you.",
                ),
                icon: const Text("🔥", style: TextStyle(fontSize: 15)),
                label: const Text(
                  "Start a Project",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              OutlinedButton.icon(
                onPressed: () => onLaunch(
                  "https://wa.me/918788357452?text=Hi%20Sagar%20👋%0A%0AI%20came%20across%20your%20portfolio%20and%20I%E2%80%99d%20like%20to%20connect%20with%20you.%0A%0AI%20have%20a%20small%20idea%20and%20wanted%20to%20discuss%20it%20with%20you.%0A%0ACan%20we%20chat%3F%20😊",
                ),
                icon: const Text("💬", style: TextStyle(fontSize: 15)),
                label: Text(
                  "Let’s Talk",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: isDark ? Colors.white30 : Colors.black26,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
