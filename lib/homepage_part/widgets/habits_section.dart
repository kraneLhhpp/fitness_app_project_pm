import 'package:fitness_app_project/homepage_part/ai_chat_part/ai_coach_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HabitsSection extends StatelessWidget {
  const HabitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _HabitCardItem(
            title: 'Goals',
            subtitle: '73% achived',
            imgPath: 'assets/images/goalsIcon.png',
            iconColor: Colors.orange,
          ),
        ),
        SizedBox(width: 15.0),
        Expanded(
          child: _HabitCardItem(
            title: 'AI-Helper',
            subtitle: 'Can help anytime',
            imgPath: 'assets/images/nutritionIcon.png',
            iconColor: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AiCoachPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HabitCardItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imgPath;
  final Color iconColor;
  final VoidCallback? onTap;

  const _HabitCardItem({
    required this.title,
    required this.subtitle,
    required this.imgPath,
    required this.iconColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, 
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        width: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.pinkAccent),
          boxShadow: [
            BoxShadow(color: Colors.pinkAccent.withValues(alpha: 0.1), blurRadius: 6),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 120, child: Image.asset(imgPath)),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
