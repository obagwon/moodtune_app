import 'package:flutter/material.dart';

class Mood {
  const Mood({
    required this.label,
    required this.icon,
    required this.backgroundColor,
  });

  final String label;
  final String icon;
  final Color backgroundColor;
}
