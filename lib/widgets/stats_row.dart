import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          _StatItem(
            label: 'Weight',
            value: '86.5',
            unit: 'kg',
            imgPath: 'assets/images/weightIcon.png',
          ),
          SizedBox(
            height: 60,
            child: VerticalDivider(color: Colors.grey, width: 1),
          ),
          _StatItem(
            label: 'Step',
            value: '1428',
            unit: 'steps',
            imgPath: 'assets/images/stepIcon.png',
          ),
          SizedBox(
            height: 60,
            child: VerticalDivider(color: Colors.grey, width: 1),
          ),
          _StatItem(
            label: 'Heart Rate',
            value: '80',
            unit: 'Bpm',
            imgPath: 'assets/images/heartbeatIcon.png',
          ),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final String imgPath;

  const _StatItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.imgPath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(height: 20, child: Image.asset(imgPath)),
            const SizedBox(width: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.grey, fontSize: 15),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 2),
            Text(
              unit,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}
