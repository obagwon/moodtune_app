import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class MoodTuneBottomNavBar extends StatelessWidget {
  const MoodTuneBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    const items = [
      _BottomNavItem(Icons.home_rounded, '홈'),
      _BottomNavItem(Icons.auto_awesome_rounded, '추천'),
      _BottomNavItem(Icons.queue_music_rounded, '플레이리스트'),
      _BottomNavItem(Icons.person_rounded, '마이'),
    ];

    return ClipRRect(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.94),
          border: const Border(top: BorderSide(color: Color(0xFFF0EAF5))),
        ),
        child: SafeArea(
          top: false,
          child: SizedBox(
            height: 74,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(items.length, (index) {
                final isActive = currentIndex == index;
                return Expanded(
                  child: InkWell(
                    onTap: () => onTap(index),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          items[index].icon,
                          color:
                              isActive ? AppColors.primary : AppColors.textSub,
                          size: 22,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          items[index].label,
                          style: TextStyle(
                            color: isActive
                                ? AppColors.primary
                                : AppColors.textSub,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _BottomNavItem {
  const _BottomNavItem(this.icon, this.label);

  final IconData icon;
  final String label;
}
