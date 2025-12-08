import 'package:flutter/material.dart';

class DailyGoals extends StatelessWidget {
  const DailyGoals({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          _DailyGoalItem(
            label1: '2000',
            label2: 'Step',
            imgPath: 'assets/images/stepDailyIcon.png',
          ),
          _DailyGoalItem(
            label1: '120',
            label2: 'Calories',
            imgPath: 'assets/images/caloriesDailyIcon.png',
          ),
          _DailyGoalItem(
            label1: '5KM',
            label2: 'Running',
            imgPath: 'assets/images/runningDailyIcon.png',
          ),
          _DailyGoalItem(
            label1: '8h',
            label2: 'Sleeping',
            imgPath: 'assets/images/sleepingDailyIcon.png',
          ),
        ],
      ),
    );
  }
}

class _DailyGoalItem extends StatelessWidget {
  final String label1;
  final String label2;
  final String imgPath;

  const _DailyGoalItem({
    required this.label1,
    required this.label2,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 140,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pinkAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withValues(alpha: 0.5),
            blurRadius: 6,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30, child: Image.asset(imgPath)),
            Spacer(),
            Text(
              label1,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              label2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
