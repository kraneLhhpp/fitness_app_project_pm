import 'package:flutter/material.dart';

class StatsRow extends StatelessWidget {
  final double weight;
  final double height;
  final int age;

  const StatsRow({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      decoration: BoxDecoration(
        color: Color(0xFF2C2C2C),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _StatItem(
            label: "Weight",
            value: weight.toString(),
            unit: "kg",
            icon: Icons.fitness_center,
          ),
          const SizedBox(
            height: 60,
            child: VerticalDivider(color: Colors.grey, width: 1),
          ),
          _StatItem(
            label: "Height",
            value: height.toString(),
            unit: "cm",
            icon: Icons.height,
          ),
          const SizedBox(
            height: 60,
            child: VerticalDivider(color: Colors.grey, width: 1),
          ),
          _StatItem(
            label: "Age",
            value: age.toString(),
            unit: "years",
            icon: Icons.favorite,
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
  final IconData icon;

  const _StatItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SizedBox(
              height: 20,
              child: Icon(icon, color: Colors.white, size: 18),
            ),
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
