import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_gradients.dart';

class SoftAppBackground extends StatelessWidget {
  const SoftAppBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: AppGradients.appBackground),
      child: Stack(
        children: [
          Positioned(
            top: -90,
            left: -80,
            child: _Glow(color: AppColors.bgLavender.withOpacity(0.9), size: 240),
          ),
          Positioned(
            top: -60,
            right: -90,
            child: _Glow(color: AppColors.bgPink.withOpacity(0.85), size: 220),
          ),
          child,
        ],
      ),
    );
  }
}

class _Glow extends StatelessWidget {
  const _Glow({required this.color, required this.size});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
        ),
      ),
    );
  }
}
