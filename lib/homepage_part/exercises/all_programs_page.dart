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
      appBar: AppBar(title: const Text("All Programs")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
          itemCount: exercises.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final ex = exercises[index];
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
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                        color: Colors.black12)
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ex.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.star, size: 14, color: Colors.blueAccent),
                        const SizedBox(width: 6),
                        Text(ex.difficulty),
                        const SizedBox(width: 16),
                        Icon(Icons.timer, size: 14, color: Colors.green),
                        const SizedBox(width: 6),
                        Text("${getMinutes(ex.difficulty)} min"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.fitness_center, size: 14, color: Colors.orange),
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
      ),
    );
  }
}
