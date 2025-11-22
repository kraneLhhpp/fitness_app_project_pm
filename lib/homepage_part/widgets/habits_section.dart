import 'package:flutter/material.dart';

class HabitsSection extends StatelessWidget {
  const HabitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
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
            title: 'Nutrition',
            subtitle: '3 hours of fasting',
            imgPath: 'assets/images/nutritionIcon.png',
            iconColor: Colors.green,
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

  const _HabitCardItem({
    required this.title,
    required this.subtitle,
    required this.imgPath,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 155,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pinkAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withValues(alpha: 0.1),
            blurRadius: 6,
          ),
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
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
