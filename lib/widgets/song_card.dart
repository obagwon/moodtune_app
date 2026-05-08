import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/song.dart';
import 'album_cover.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    required this.song,
    required this.index,
    required this.onTap,
    super.key,
  });

  final Song song;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Container(
          constraints: const BoxConstraints(minHeight: 96),
          padding: const EdgeInsets.fromLTRB(12, 12, 46, 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: AppColors.cardBorder),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF504678).withValues(alpha: 0.06),
                offset: const Offset(0, 8),
                blurRadius: 18,
              ),
            ],
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  AlbumCover(song: song),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${index + 1}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w900),
                            ),
                            const SizedBox(width: 9),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    song.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    song.artist,
                                    style: const TextStyle(
                                        color: AppColors.textSub, fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 5,
                          runSpacing: 4,
                          children: song.tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF3EFFF),
                                    borderRadius: BorderRadius.circular(999),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      color: Color(0xFF7564C7),
                                      fontSize: 10,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Positioned(
                top: -5,
                right: -32,
                child: Text('Mood',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w900)),
              ),
              Positioned(
                right: -32,
                bottom: -2,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFFBF9FF),
                    border: Border.all(color: const Color(0xFFE4DDEC)),
                  ),
                  child: const Center(
                    child: Icon(Icons.play_arrow_rounded,
                        size: 16, color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
