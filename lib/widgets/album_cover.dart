import 'package:flutter/material.dart';

import '../models/song.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({
    required this.song,
    this.size = 72,
    this.showArtworkDetails = false,
    super.key,
  });

  final Song song;
  final double size;
  final bool showArtworkDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(showArtworkDetails ? 22 : 12),
        gradient: song.coverGradient,
        boxShadow: showArtworkDetails
            ? [
                BoxShadow(
                  color: const Color(0xFF262255).withOpacity(0.20),
                  offset: const Offset(0, 14),
                  blurRadius: 34,
                ),
              ]
            : null,
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.white.withOpacity(0.20), Colors.black.withOpacity(0.14)],
                ),
              ),
            ),
          ),
          if (!showArtworkDetails)
            Center(child: Text(song.icon, style: const TextStyle(fontSize: 28)))
          else ...[
            Positioned(
              top: size * 0.10,
              left: 24,
              right: 24,
              child: Text(
                '✦   ✧   ✦',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.76),
                  fontSize: 16,
                  letterSpacing: 8,
                ),
              ),
            ),
            Positioned(
              top: size * 0.20,
              left: 0,
              right: 0,
              child: Text(
                song.icon == '🌙' ? '☾' : song.icon,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.92),
                  fontSize: size * 0.18,
                ),
              ),
            ),
            Positioned(
              left: 28,
              right: 28,
              bottom: 0,
              height: size * 0.25,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  _Building(heightFactor: 0.62),
                  SizedBox(width: 7),
                  _Building(heightFactor: 0.90),
                  SizedBox(width: 7),
                  _Building(heightFactor: 0.70),
                  SizedBox(width: 7),
                  _Building(heightFactor: 0.96),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Building extends StatelessWidget {
  const _Building({required this.heightFactor});

  final double heightFactor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FractionallySizedBox(
        heightFactor: heightFactor,
        alignment: Alignment.bottomCenter,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color(0xFF111432).withOpacity(0.78),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(7)),
          ),
        ),
      ),
    );
  }
}
