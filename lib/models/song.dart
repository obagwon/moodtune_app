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

const songs = [
  Song(
    title: 'Late Library',
    artist: '스하리',
    icon: '📚',
    coverGradient: AppGradients.libraryCover,
    tags: ['우울해요', '공부', '감성'],
    duration: '3:42',
  ),
  Song(
    title: '밤공기',
    artist: '서우',
    icon: '🌙',
    coverGradient: AppGradients.nightCover,
    tags: ['우울해요', '밤', '몽환'],
    duration: '3:48',
  ),
  Song(
    title: 'Slow Campus',
    artist: '민재',
    icon: '🏫',
    coverGradient: AppGradients.campusCover,
    tags: ['설레요', '감성', '몽환'],
    duration: '4:01',
  ),
  Song(
    title: 'Rainy Walk',
    artist: '흐린밴드',
    icon: '☔',
    coverGradient: AppGradients.rainCover,
    tags: ['우울해요', '감성', '비'],
    duration: '3:55',
  ),
];
