import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppGradients {
  AppGradients._();

  static const appBackground = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFFFFDFC), Color(0xFFFFF8FB)],
  );

  static const primaryButton = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [Color(0xFF7157E8), AppColors.accentPink],
  );

  static const playButton = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFB7A9FF), AppColors.primary],
  );

  static const libraryCover = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF39241D), Color(0xFF8B5837), Color(0xFFFFD39C)],
    stops: [0, 0.52, 1],
  );

  static const nightCover = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF17244F), Color(0xFF5451A6), Color(0xFFF2A6C9)],
    stops: [0, 0.55, 1],
  );

  static const campusCover = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF705C85), Color(0xFFE8A66D), Color(0xFFF5D7A0)],
    stops: [0, 0.55, 1],
  );

  static const rainCover = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0C3447), Color(0xFF23627C), Color(0xFF9FC0D2)],
    stops: [0, 0.5, 1],
  );
}
