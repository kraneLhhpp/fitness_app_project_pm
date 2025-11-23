import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/exercises/muscle_detail_page.dart';
import 'package:fitness_app_project/homepage_part/widgets/muscle_group_card.dart';
import 'package:fitness_app_project/services/exercise_api_service.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:flutter/material.dart';

class AllCoursesPage extends StatefulWidget {
  final User user;
  const AllCoursesPage({super.key, required this.user});

  @override
  State<AllCoursesPage> createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  final _api = ExerciseApiService();
  late Future<Map<String, List<Exercise>>> _allExercisesFuture;

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
  void initState() {
    super.initState();
    _allExercisesFuture = _api.getAllMuscleExercises();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Courses")),

      body: FutureBuilder(
        future: _allExercisesFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;

          return ListView(
            children: data.entries.map((entry) {
              final muscle = entry.key;
              final exercises = entry.value;

              if (exercises.isEmpty) return SizedBox.shrink();

              return MuscleGroupCard(
                muscle: muscle,
                imagePath: muscleImages[muscle] ?? "assets/images/default.png",
                exercisesCount: exercises.length,
                minutes: exercises.length * 2,
                level: "Beginner",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MuscleDetailsPage(
                        muscle: muscle,
                        imagePath: muscleImages[muscle]!,
                        exercisesCount: exercises.length,
                        level: exercises.first.difficulty, // берем сложность первого упражнения
                        exercises: exercises,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        },
      ),

    );
  }
}
