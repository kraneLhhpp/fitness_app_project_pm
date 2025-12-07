import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/main_menu_pages/stats_store.dart';
import 'package:fitness_app_project/homepage_part/widgets/dark_header.dart';
import 'package:fitness_app_project/homepage_part/widgets/habits_section.dart';
import 'package:fitness_app_project/homepage_part/widgets/stats_row.dart';
import 'package:fitness_app_project/homepage_part/widgets/training_days.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsScreen extends StatelessWidget {
  final User user;

  const StatsScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final age = StatsStore.age;
    final height = StatsStore.height;
    final weight = StatsStore.weight;

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
                  DarkHeader(user: user),
                  const SizedBox(height: 30),

                  StatsRow(
                    weight: (weight ?? 0).toDouble(),
                    height: (height ?? 0).toDouble(),
                    age: age ?? 0,
                  ),

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
                  children: [
                    Text(
                      'What are you training today?',
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    const TrainingDays(),

                    const SizedBox(height: 30),
                    Text(
                      'Your habits',
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),

                    const HabitsSection(),
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
