import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';
import 'package:fitness_app_project/homepage_part/services/completed_service.dart';
import 'package:fitness_app_project/homepage_part/widgets/exercise_box.dart';
import 'package:flutter/material.dart';

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
        title: const Text(
          'Daily Reports',
          style: TextStyle(color: Color(0xFF808B9A)),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const Text(
                'Track your activity',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent activity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  GestureDetector(
                    onTap: () {
                      setState(() => selectedDay = null);
                    },
                    child: const Row(
                      children: [
                        Text(
                          'Show All',
                          style: TextStyle(color: Color(0xFF1B85F3)),
                        ),
                        SizedBox(width: 5),
                        Icon(Icons.replay_outlined, color: Color(0xFF1B85F3)),
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
                    icon: const Icon(Icons.date_range, color: Colors.pinkAccent),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    selectedDay == null
                        ? 'All activity'
                        : selectedDay!.toString().split(" ").first,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: Builder(
                  builder: (context) {
                    if (filtered.isEmpty) {
                      return const Center(
                        child: Text(
                          'No completed exercises',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
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
                              Text(
                                'Completed: ${entry.completedDate.toString().split(" ").first}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
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
