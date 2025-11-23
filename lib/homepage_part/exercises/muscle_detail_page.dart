import 'package:fitness_app_project/homepage_part/exercises/all_programs_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';

class MuscleDetailsPage extends StatelessWidget {
  final String muscle;
  final String imagePath;
  final int exercisesCount;
  final String level;
  final List<Exercise> exercises;

   MuscleDetailsPage({
    super.key,
    required this.muscle,
    required this.imagePath,
    required this.exercisesCount,
    required this.level,
    required this.exercises,
  });

  final muscleImages = {
    "abdominals": "assets/images/abs_training.png",
    "biceps": "assets/images/biceps_training.png",
    "chest": "assets/images/chest_training.png",
    "forearms": "assets/images/forearms_training.png",
    "glutes": "assets/images/glutes_training.png",
    "lats": "assets/images/lats_training.png",
    "lower_back": "assets/images/lower_back_training.png",
    "middle_back": "assets/images/middle_back_training.png",
    "neck": "assets/images/neck_training.png",
    "quadriceps": "assets/images/quad_training.png",
    "triceps": "assets/images/triceps_training.png",
  };

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
      appBar: AppBar(
        title: Text(muscle.toUpperCase()),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),
          Text("Start Your $muscle Workout",
              style:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: AssetImage(muscleImages[muscle]!), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Programs",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AllProgramsPage(exercises: exercises),
                    ),
                  );
                },
                child: const Text("See all"),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: exercises.take(2).map((ex) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDetailsPage(exercise: ex),
                      ),
                    );
                  },
                  child: _programCard(
                    title: ex.name,
                    level: ex.difficulty,
                    minutes: getMinutes(ex.difficulty),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _programCard({
    required String title,
    required String level,
    required int minutes,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              blurRadius: 10, offset: const Offset(0, 5), color: Colors.black12)
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.star, size: 12, color: Colors.blue),
              const SizedBox(width: 6),
              Text(level),
            ],
          ), 
          Row(
            children: [
              Icon(Icons.timer, size: 12, color: Colors.green),
              const SizedBox(width: 6),
              Text("$minutes min"),
            ],
          )
        ],
      ),
    );
  }
}
