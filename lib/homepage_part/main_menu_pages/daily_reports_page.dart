import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';
import 'package:fitness_app_project/homepage_part/services/completed_service.dart';
import 'package:fitness_app_project/homepage_part/widgets/exercise_box.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyReportsPage extends StatefulWidget {
  const DailyReportsPage({super.key});

  @override
  State<DailyReportsPage> createState() => _DailyReportsPageState();
}

class _DailyReportsPageState extends State<DailyReportsPage> {
  final completedService = CompletedService();
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    final filtered = selectedDay == null
        ? completedService.completed
        : completedService.getByDay(selectedDay!);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Daily Reports',
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(color: Colors.grey),
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          SizedBox(width: 10),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Track your activity',
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent activity',
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() => selectedDay = null);
                    },
                    child: Row(
                      children: [
                        Text(
                          'Show All',
                          style: GoogleFonts.jetBrainsMono(
                            textStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.pinkAccent,
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.replay_outlined, color: Colors.pinkAccent),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await showDatePicker(
                        context: context,
                        firstDate: DateTime(2024),
                        lastDate: DateTime.now(),
                        initialDate: selectedDay ?? DateTime.now(),
                      );

                      if (result != null) {
                        setState(() => selectedDay = result);
                      }
                    },
                    icon: const Icon(
                      Icons.date_range,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    selectedDay == null
                        ? 'All activity'
                        : selectedDay!.toString().split(" ").first,
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Colors.pinkAccent,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Builder(
                  builder: (context) {
                    if (filtered.isEmpty) {
                      return Center(
                        child: Text(
                          'No completed exercises',
                          style: GoogleFonts.jetBrainsMono(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      );
                    }

                    return ListView.separated(
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemCount: filtered.length,
                      itemBuilder: (context, index) {
                        final entry = filtered[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => ExerciseDetailsPage(
                                  exercise: entry.exercise,
                                ),
                              ),
                            );
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ExerciseBox(ex: entry.exercise),
                              SizedBox(height: 5),
                              Text(
                                'Completed: ${entry.completedDate.toString().split(" ").first}',
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
