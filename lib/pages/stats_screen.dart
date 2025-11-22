import 'package:flutter/material.dart';
import 'package:fitness_app_project/widgets/dark_header.dart';
import 'package:fitness_app_project/widgets/stats_row.dart';
import '../widgets/training_days.dart';
import '../widgets/habits_section.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const DarkHeader(),
                  const SizedBox(height: 30),

                  const StatsRow(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'What are you training today?',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),

                    TrainingDays(),

                    SizedBox(height: 30),
                    Text(
                      'Your habits',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),

                    HabitsSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
