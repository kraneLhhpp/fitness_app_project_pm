import 'package:fitness_app_project/homepage_part/exercises/see_all_programs_page.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/homepage_part/services/exercise_api_service.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';

class ProgramsSection extends StatefulWidget {
  final String currentMuscle;

  const ProgramsSection({super.key, required this.currentMuscle});

  @override
  State<ProgramsSection> createState() => _ProgramsSectionState();
}

class _ProgramsSectionState extends State<ProgramsSection> {
  final List<String> muscles = [
    'abdominals',
    'biceps',
    'chest',
    'forearms',
    'glutes',
    'lats',
    'lower_back',
    'middle_back',
    'neck',
    'quadriceps',
    'triceps'
  ];

  late String nextMuscle;
  late Future<List<Exercise>> futureTwoExercises;

  @override
  void initState() {
    super.initState();

    int currentIndex = muscles.indexOf(widget.currentMuscle);
    int nextIndex = (currentIndex + 1) % muscles.length;
    nextMuscle = muscles[nextIndex];

    futureTwoExercises =
        ExerciseApiService().fetchExercisesByMuscle(widget.currentMuscle, limit: 2);
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final String today = "${now.month.toString().padLeft(2, '0')}/${now.day.toString().padLeft(2, '0')}/${now.year}";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Programs",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeeAllProgramsPage(muscle: widget.currentMuscle),
                    ),
                  );
                },
                child: const Text("See all"))
          ],
        ),

        Text(
          today,
          style: const TextStyle(color: Colors.grey),
        ),

        const SizedBox(height: 15),

        FutureBuilder<List<Exercise>>(
          future: futureTwoExercises,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            final items = snapshot.data!;

            if (items.isEmpty) {
              return const Text("No exercises found.");
            }

            return Column(
              children: items.map((e) {
                final estimatedMinutes = (e.instructions.length / 250 * 10).round();

                return Card(
                  child: ListTile(
                    title: Text(e.name),
                    subtitle: Text(
                        "${widget.currentMuscle.toUpperCase()} • $estimatedMinutes minutes"),
                  ),
                );
              }).toList(),
            );
          },
        ),

        const SizedBox(height: 20),

        Text(
          "Next courses: $nextMuscle",
          style: const TextStyle(fontSize: 16, color: Colors.blue),
        )
      ],
    );
  }
}
