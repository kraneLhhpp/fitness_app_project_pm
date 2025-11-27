import 'package:fitness_app_project/homepage_part/widgets/exercise_box.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';
import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AllProgramsPage extends StatelessWidget {
  final List<Exercise> exercises;
  const AllProgramsPage({super.key, required this.exercises});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "All Programs",
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
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
            child: ExerciseBox(ex: ex),
          );
        },
      ),
    );
  }
}
