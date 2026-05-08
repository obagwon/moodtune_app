import 'package:flutter/material.dart';

class SituationChip extends StatelessWidget {
  const SituationChip({
    required this.icon,
    required this.label,
    required this.color,
    super.key,
  });

  final String icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 72,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFEDE7F5)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF645296).withOpacity(0.06),
            offset: const Offset(0, 6),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: 7),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF5D566D),
              fontSize: 11,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
