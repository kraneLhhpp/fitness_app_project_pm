import 'package:flutter/material.dart';

class TrainingDays extends StatelessWidget {
  const TrainingDays({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const <Widget>[
          _TrainingDayItem(
            label: 'Chest Day',
            imgPath: 'assets/images/chestIcon.png',
          ),
          _TrainingDayItem(
            label: 'Legs',
            imgPath: 'assets/images/legsIcon.png',
          ),
          _TrainingDayItem(
            label: 'Back & Shoulders',
            imgPath: 'assets/images/backIcon.png',
          ),
          _TrainingDayItem(
            label: 'unknown',
            imgPath: 'assets/images/chestIcon.png',
          ),
        ],
      ),
    );
  }
}

class _TrainingDayItem extends StatelessWidget {
  final String label;
  final String imgPath;

  const _TrainingDayItem({required this.label, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 130,
      margin: const EdgeInsets.only(right: 15.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.pinkAccent),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withValues(alpha: 0.5),
            blurRadius: 6,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 60, child: Image.asset(imgPath)),
          const SizedBox(height: 5),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
