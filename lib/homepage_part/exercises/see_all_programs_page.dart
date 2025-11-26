import 'package:fitness_app_project/homepage_part/services/exercise_api_service.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';
import 'package:flutter/material.dart';

class SeeAllProgramsPage extends StatelessWidget {
  final String muscle;

  const SeeAllProgramsPage({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$muscle programs")),
      body: FutureBuilder<List<Exercise>>(
        future: ExerciseApiService().fetchExercisesByMuscle(muscle, limit: 10),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final items = snapshot.data!;

          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final e = items[i];
              final minutes = (e.instructions.length / 250 * 10).round();

              return Card(
                child: ListTile(
                  title: Text(e.name),
                  subtitle: Text(
                      "${muscle.toUpperCase()} • $minutes minutes"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
