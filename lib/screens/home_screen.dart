import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../models/mood.dart';
import '../widgets/bottom_nav_bar.dart';
import '../widgets/mood_card.dart';
import '../widgets/situation_chip.dart';
import '../widgets/soft_app_background.dart';
import 'recommend_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Mood? _selectedMood;

  static const _moods = [
    Mood(label: '행복해요', icon: '☀️', backgroundColor: Color(0xFFFFF6E6)),
    Mood(label: '잔잔해요', icon: '🌙', backgroundColor: Color(0xFFF3EDFF)),
    Mood(label: '우울해요', icon: '🌧️', backgroundColor: Color(0xFFF2F3FA)),
    Mood(label: '집중하고\n싶어요', icon: '💡', backgroundColor: Color(0xFFF5F1FF)),
    Mood(label: '설레요', icon: '💗', backgroundColor: Color(0xFFFFF0F7)),
    Mood(label: '위로가\n필요해요', icon: '🫂', backgroundColor: Color(0xFFFFF4F1)),
  ];

  void _openRecommend(Mood mood) {
    setState(() => _selectedMood = mood);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RecommendScreen(selectedMood: mood)),
    );
  }

  void _handleNavTap(int index) {
    if (index == 0) return;
    if (index == 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('마이페이지는 준비 중입니다')),
      );
      return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecommendScreen(selectedMood: _selectedMood ?? _moods[1]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SoftAppBackground(
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('안녕하세요,', style: TextStyle(color: AppColors.textSub, fontSize: 15)),
                              SizedBox(height: 6),
                              Text(
                                '오늘 기분은 어떤가요? ✨',
                                style: TextStyle(
                                  color: AppColors.textMain,
                                  fontSize: 24,
                                  height: 1.3,
                                  letterSpacing: -0.7,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0xFF504678).withOpacity(0.08),
                                  offset: const Offset(0, 8),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: const Center(child: Text('🔔')),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      GridView.builder(
                        itemCount: _moods.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 11,
                          crossAxisSpacing: 11,
                          childAspectRatio: 0.72,
                        ),
                        itemBuilder: (context, index) {
                          final mood = _moods[index];
                          return MoodCard(
                            mood: mood,
                            isSelected: _selectedMood?.label == mood.label,
                            onTap: () => _openRecommend(mood),
                          );
                        },
                      ),
                      const SizedBox(height: 34),
                      const Text(
                        '상황별 추천',
                        style: TextStyle(fontSize: 20, letterSpacing: -0.5, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 14),
                      const SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SituationChip(icon: '📖', label: '시험기간', color: Color(0xFFF3EFFF)),
                            SizedBox(width: 10),
                            SituationChip(icon: '💻', label: '과제할 때', color: Color(0xFFF3F5FF)),
                            SizedBox(width: 10),
                            SituationChip(icon: '🌙', label: '밤산책', color: Color(0xFFFFF5DF)),
                            SizedBox(width: 10),
                            SituationChip(icon: '☂️', label: '비 오는 날', color: Color(0xFFF8F0FF)),
                            SizedBox(width: 10),
                            SituationChip(icon: '🚌', label: '통학길', color: Color(0xFFFFF0F7)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              MoodTuneBottomNavBar(currentIndex: 0, onTap: _handleNavTap),
            ],
          ),
        ),
      ),
    );
  }
}
