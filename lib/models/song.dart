import 'package:flutter/material.dart';

import '../constants/app_gradients.dart';

class Song {
  const Song({
    required this.title,
    required this.artist,
    required this.icon,
    required this.coverGradient,
    required this.tags,
    required this.duration,
  });

  final String title;
  final String artist;
  final String icon;
  final Gradient coverGradient;
  final List<String> tags;
  final String duration;
}

/// Data migrated from the original JavaScript songs array.
const songs = [
  Song(
    title: 'Late Library',
    artist: '윤하린',
    icon: '📚',
    coverGradient: AppGradients.libraryCover,
    tags: ['잔잔한', '공부', '감성'],
    duration: '3:42',
  ),
  Song(
    title: '밤공기',
    artist: '서우',
    icon: '🌙',
    coverGradient: AppGradients.nightCover,
    tags: ['잔잔한', '밤', '힐링'],
    duration: '3:48',
  ),
  Song(
    title: 'Slow Campus',
    artist: '민재',
    icon: '🌿',
    coverGradient: AppGradients.campusCover,
    tags: ['잔잔한', '감성', '힐링'],
    duration: '4:01',
  ),
  Song(
    title: 'Rainy Walk',
    artist: '하린밴드',
    icon: '☔',
    coverGradient: AppGradients.rainCover,
    tags: ['잔잔한', '감성', '비'],
    duration: '3:55',
  ),
];
