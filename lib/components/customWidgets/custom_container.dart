import 'package:flutter/material.dart';

import '../../core/app_styles.dart';

/// ================= CUSTOM CONTAINER =================
class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.label,
    required this.icon,
    this.trailingText,
  });

  final String label;
  final IconData icon;
  final String? trailingText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: AppStyles.normal16black.copyWith(
              color: Colors.black54,
            ),
          ),
          const Spacer(),
          if (trailingText != null) ...[
            Text(
              trailingText!.toUpperCase(),
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(width: 12),
          ],
          Icon(icon, color: Colors.black54),
        ],
      ),
    );
  }
}
