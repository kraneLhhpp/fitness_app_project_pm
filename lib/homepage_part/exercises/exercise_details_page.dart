import 'package:flutter/material.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:fitness_app_project/services/favorite_service.dart';

class ExerciseDetailsPage extends StatelessWidget {
  final Exercise exercise;
  const ExerciseDetailsPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final isFav = FavoriteService().isFavorite(exercise);

    return Scaffold(
      appBar: AppBar(title: Text(exercise.name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(exercise.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("Muscle: ${exercise.muscle}"),
            Text("Equipment: ${exercise.equipment}"),
            Text("Difficulty: ${exercise.difficulty}"),
            const SizedBox(height: 20),
            const Text("Instructions:", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 5),
            Text(exercise.instructions),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(isFav ? Icons.check : Icons.favorite),
              label: Text(isFav ? "Added to My Courses" : "Add to My Courses"),
              onPressed: () {
                FavoriteService().addToFavorites(exercise);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${exercise.name} added to My Courses")),
                );
                (context as Element).markNeedsBuild();
              },
            )
          ],
        ),
      ),
    );
  }
}
