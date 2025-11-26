import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';
import 'package:flutter/material.dart';

class ExerciseBox extends StatelessWidget {
  const ExerciseBox({
    super.key,
    required this.ex,
  });

  final Exercise ex;

  int getMinutes(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return 15;
      case 'intermediate':
        return 25;
      case 'advanced':
      case 'expert':
        return 40;
      default:
        return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  color: Colors.pinkAccent.withValues(alpha: 0.4),
                  width: 1.5,
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          ex.name,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 12),
    
        Row(
          children: [
            const Icon(Icons.star, size: 16, color: Colors.pinkAccent),
            const SizedBox(width: 6),
            Text(ex.difficulty),
            const SizedBox(width: 16),
            const Icon(Icons.timer, size: 16, color: Colors.green),
            const SizedBox(width: 6),
            Text("${getMinutes(ex.difficulty)} min"),
          ],
        ),
    
        const SizedBox(height: 10),
    
        Row(
          children: [
            const Icon(Icons.fitness_center,
                size: 16, color: Colors.orange),
            const SizedBox(width: 6),
            Text(ex.equipment),
          ],
        ),
      ],
      )
    );
  }
}