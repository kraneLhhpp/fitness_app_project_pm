import 'package:fitness_app_project/homepage_part/services/exercise_api_service.dart';
import 'package:flutter/material.dart';

class ExercisesPage extends StatelessWidget {
  final String muscle;

  const ExercisesPage({super.key, required this.muscle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$muscle exercises")),
      body: FutureBuilder(
        future: ExerciseApiService().getExercises(muscle: muscle),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final exercises = snapshot.data!;

          return ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (_, i) => ListTile(
              title: Text(exercises[i].name),
              subtitle: Text(exercises[i].equipment),
            ),
          );
        },
      ),
    );
  }
}
