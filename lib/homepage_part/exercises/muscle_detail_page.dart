import 'package:fitness_app_project/homepage_part/exercises/all_programs_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';
import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';

class MuscleDetailsPage extends StatelessWidget {
  final String muscle;
  final int exercisesCount;
  final String level;
  final List<Exercise> exercises;

  MuscleDetailsPage({
    super.key,
    required this.muscle,
    required this.exercisesCount,
    required this.level,
    required this.exercises,
  });

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        title: Text(
          muscle.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Stack(
              children: [
                Image.asset(
                  muscleImages[muscle]!,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withValues(alpha: 0.7),
                          Colors.transparent
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      "Start Your $muscle Workout",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          const SizedBox(height: 25),

          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Programs",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => AllProgramsPage(exercises: exercises),
                    ),
                  );
                },
                child: const Text(
                  "See all",
                  style: TextStyle(color: Colors.pinkAccent),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          // First two exercise cards
          ...exercises.take(2).map((ex) => GestureDetector(
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
          )),
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
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.pinkAccent.withValues(alpha: 0.4), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.pinkAccent.withValues(alpha: 0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              const Icon(Icons.star, size: 16, color: Colors.pinkAccent),
              const SizedBox(width: 6),
              Text(level),
              const SizedBox(width: 16),
              const Icon(Icons.timer, size: 16, color: Colors.green),
              const SizedBox(width: 6),
              Text("$minutes min"),
            ],
          ),
        ],
      ),
    );
  }
}
