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
    "abdominals": "assets/images/gym_zall.png",
    "biceps": "assets/images/gym_zall.png",
    "chest": "assets/images/gym_zall.png",
    "forearms": "assets/images/gym_zall.png",
    "glutes": "assets/images/gym_zall.png",
    "lats": "assets/images/gym_zall.png",
    "lower_back": "assets/images/gym_zall.png",
    "middle_back": "assets/images/gym_zall.png",
    "neck": "assets/images/gym_zall.png",
    "quadriceps": "assets/images/gym_zall.png",
    "triceps": "assets/images/gym_zall.png",
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
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

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
                minutes: exercises.length * 2, // пример
                level: "Beginner",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MuscleDetailsPage(
                        muscle: muscle,
                        imagePath: muscleImages[muscle]!,
                        exercisesCount: exercises.length,
                        minutes: exercises.length * 2,
                        level: "Beginner",
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
