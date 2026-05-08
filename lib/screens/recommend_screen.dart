import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_gradients.dart';
import '../models/mood.dart';
import '../models/song.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/soft_app_background.dart';
import '../widgets/song_card.dart';
import 'home_screen.dart';
import 'player_screen.dart';

class RecommendScreen extends StatelessWidget {
  const RecommendScreen({required this.selectedMood, super.key});

  final Mood selectedMood;

  void _handleNavTap(BuildContext context, int index) {
    if (index == 0) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
      return;
    }
    if (index == 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('마이페이지는 준비 중입니다')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final moodLabel = selectedMood.label.replaceAll('\n', ' ');

    return Scaffold(
      body: SoftAppBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 92,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Positioned(
                              left: -8,
                              top: 0,
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                    Icons.arrow_back_ios_new_rounded),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 18),
                              child: Text(
                                '지금 기분에 어울리는 음악',
                                style: TextStyle(
                                  fontSize: 21,
                                  letterSpacing: -0.6,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEDE8FF),
                                  borderRadius: BorderRadius.circular(999),
                                ),
                                child: Text(
                                  '${selectedMood.icon} $moodLabel',
                                  style: const TextStyle(
                                    color: AppColors.primaryDark,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 22),
                      ListView.separated(
                        itemCount: songs.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final song = songs[index];
                          return SongCard(
                            song: song,
                            index: index,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PlayerScreen(song: song)),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 22),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('플레이리스트에 저장되었습니다')),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 56,
                          decoration: BoxDecoration(
                            gradient: AppGradients.primaryButton,
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    AppColors.primary.withValues(alpha: 0.28),
                                offset: const Offset(0, 10),
                                blurRadius: 24,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              '플레이리스트로 저장',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MoodTuneBottomNavBar(
                  currentIndex: 1,
                  onTap: (index) => _handleNavTap(context, index)),
            ],
          ),
        ),
      ),
    );
  }
}
