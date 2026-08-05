import 'package:flutter/material.dart';

class ContactActionBar extends StatelessWidget {
  final bool isDark;
  final Function(String) onLaunch;

  const ContactActionBar({
    super.key,
    required this.isDark,
    required this.onLaunch,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDark ? Colors.white : const Color(0xFF0F172A);

    final actions = [
      {
        "name": "Instagram",
        "icon": Icons.camera_alt,
        "url":
            "https://www.instagram.com/sagar_borkar_sg?igsh=bmM4cG9tbjh2ZGFm",
      },
      {
        "name": "LinkedIn",
        "icon": Icons.work,
        "url": "https://www.linkedin.com/in/sagar-borkar-724ba7315",
      },
      {
        "name": "Facebook",
        "icon": Icons.facebook,
        "url": "https://www.facebook.com/share/1KDS9vSibg/",
      },
      {
        "name": "GitHub",
        "icon": Icons.code,
        "url": "https://github.com/sagarborkar0888-wq",
      },
      {
        "name": "WhatsApp",
        "icon": Icons.chat,
        "url":
            "https://wa.me/918788357452?text=🚀%20Project%20Inquiry%0A%0AHi%20Sagar%20👋%0A%0AI%20found%20your%20portfolio%20and%20I%E2%80%99m%20interested%20in%20working%20with%20you.%0A%0A📝%20Project%20Details:%0A%E2%80%A2%20Project%20Type:%20(App%20/%20Website%20/%20Both)%0A%E2%80%A2%20Features%20Required:%20%0A%E2%80%A2%20Budget:%20%0A%E2%80%A2%20Timeline:%20%0A%0A💡%20Additional%20Information:%0A(Briefly%20explain%20your%20idea%20or%20goal)%0A%0ALooking%20forward%20to%20your%20response.%0A%0AThank%20you.",
      },
      {
        "name": "Email",
        "icon": Icons.email,
        "url": "mailto:sagarborkar0888@email.com",
      },
      {"name": "Call", "icon": Icons.call, "url": "tel:+918788357452"},
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      children: actions.map((act) {
        return InkWell(
          onTap: () => onLaunch(act["url"] as String),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.04)
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isDark
                    ? Colors.white.withValues(alpha: 0.08)
                    : Colors.black.withValues(alpha: 0.08),
              ),
              boxShadow: isDark
                  ? null
                  : [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 6,
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  act["icon"] as IconData,
                  color: const Color(0xFF2563EB),
                  size: 15,
                ),
                const SizedBox(width: 6),
                Text(
                  act["name"] as String,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
