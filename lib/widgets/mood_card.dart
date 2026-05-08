import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/mood.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    required this.mood,
    required this.onTap,
    this.isSelected = false,
    super.key,
  });

  final Mood mood;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.03 : 1,
      duration: const Duration(milliseconds: 180),
      child: Material(
        color: mood.backgroundColor,
        borderRadius: BorderRadius.circular(18),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(18),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: isSelected
                    ? AppColors.primaryLight
                    : const Color(0xFFEEE7F3),
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF504678)
                      .withOpacity(isSelected ? 0.16 : 0.04),
                  offset: const Offset(0, 8),
                  blurRadius: isSelected ? 24 : 18,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(mood.icon, style: const TextStyle(fontSize: 38)),
                const SizedBox(height: 14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    mood.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.primaryDark
                          : const Color(0xFF514A63),
                      fontSize: 14,
                      height: 1.35,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
