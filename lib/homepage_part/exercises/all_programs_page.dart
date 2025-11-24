import 'package:flutter/material.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';

class AllProgramsPage extends StatelessWidget {
  final List<Exercise> exercises;
  const AllProgramsPage({super.key, required this.exercises});

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
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "All Programs",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: exercises.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),

        itemBuilder: (context, i) {
          final ex = exercises[i];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ExerciseDetailsPage(exercise: ex),
                ),
              );
            },
            child: Container(
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
              ),
            ),
          );
        },
      ),
    );
  }
}
