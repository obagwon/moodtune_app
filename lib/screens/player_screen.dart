import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_gradients.dart';
import '../models/song.dart';
import '../widgets/album_cover.dart';
import '../widgets/soft_app_background.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({required this.song, super.key});

  final Song song;

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  bool _isLiked = false;
  bool _isPlaying = true;

  static const _waveHeights = [
    12.0, 19.0, 28.0, 16.0, 34.0, 22.0, 11.0, 24.0, 30.0, 14.0,
    18.0, 31.0, 25.0, 15.0, 27.0, 10.0, 32.0, 21.0, 13.0, 29.0,
    17.0, 26.0, 34.0, 20.0, 12.0, 23.0, 30.0, 16.0, 27.0, 11.0,
    19.0, 33.0, 24.0, 15.0, 28.0, 22.0, 13.0, 31.0, 18.0, 25.0,
    10.0, 29.0, 34.0, 17.0, 21.0, 27.0, 14.0, 30.0, 19.0, 12.0,
  ];

  @override
  Widget build(BuildContext context) {
    final otherSongs = songs.where((song) => song.title != widget.song.title).take(3).toList();

    return Scaffold(
      body: SoftAppBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 18),
            child: Column(
              children: [
                SizedBox(
                  height: 38,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Text('⌄', style: TextStyle(fontSize: 34, height: 1)),
                      ),
                      const Text('•••', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return AlbumCover(
                      song: widget.song,
                      size: constraints.maxWidth,
                      showArtworkDetails: true,
                    );
                  },
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.song.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.7,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(widget.song.artist, style: const TextStyle(color: AppColors.textSub, fontSize: 14)),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => setState(() => _isLiked = !_isLiked),
                      icon: Text(
                        _isLiked ? '♥' : '♡',
                        style: TextStyle(
                          color: _isLiked ? AppColors.accentPink : AppColors.textMain,
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                SizedBox(
                  height: 34,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _waveHeights
                        .map(
                          (height) => Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 3,
                                height: height,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(999),
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [AppColors.primary, Color(0xFFF3A6CD)],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 4),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('1:18', style: TextStyle(color: AppColors.textSub, fontSize: 12)),
                    Text('3:48', style: TextStyle(color: AppColors.textSub, fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 23),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _ControlButton(label: '⌘'),
                    _ControlButton(label: '⏮'),
                    GestureDetector(
                      onTap: () => setState(() => _isPlaying = !_isPlaying),
                      child: Container(
                        width: 66,
                        height: 66,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: AppGradients.playButton,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withOpacity(0.32),
                              offset: const Offset(0, 10),
                              blurRadius: 24,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            _isPlaying ? '❚❚' : '▶',
                            style: const TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                    ),
                    _ControlButton(label: '⏭'),
                    _ControlButton(label: '↻'),
                  ],
                ),
                const SizedBox(height: 28),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(17),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: AppColors.cardBorder),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF504678).withOpacity(0.06),
                        offset: const Offset(0, 8),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: const Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('이 노래를 추천한 이유', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w900)),
                              Text('♡', style: TextStyle(color: AppColors.primary, fontSize: 18)),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            '지친 하루 끝, 마음을 차분하게\n정리하고 싶을 때 어울리는 곡이에요.',
                            style: TextStyle(color: AppColors.textSub, fontSize: 14, height: 1.6),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 4,
                        bottom: 0,
                        child: Text('♫', style: TextStyle(color: Color(0xFFB7A2FF), fontSize: 32)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('다음 곡 미리 보기', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900)),
                ),
                const SizedBox(height: 12),
                ...otherSongs.map((song) => _NextSongRow(song: song)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(label, style: const TextStyle(color: AppColors.textMain, fontSize: 22));
  }
}

class _NextSongRow extends StatelessWidget {
  const _NextSongRow({required this.song});

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          AlbumCover(song: song, size: 48),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(song.title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800)),
                const SizedBox(height: 3),
                Text(song.artist, style: const TextStyle(color: AppColors.textSub, fontSize: 12)),
              ],
            ),
          ),
          Text(song.duration, style: const TextStyle(color: AppColors.textLight, fontSize: 12)),
        ],
      ),
    );
  }
}
