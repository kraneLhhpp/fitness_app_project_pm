import 'package:fitness_app_project/homepage_part/widgets/workoutplan_step_4_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutplanStep2Page extends StatefulWidget {
  const WorkoutplanStep2Page({super.key});

  @override
  State<WorkoutplanStep2Page> createState() => _WorkoutplanStep2PageState();
}

class _WorkoutplanStep2PageState extends State<WorkoutplanStep2Page> {
  final List<FitnessOption> options = [
    FitnessOption("Running", "assets/images/runningIocn.png"),
    FitnessOption("Yoga", "assets/images/yogaIcon.png"),
    FitnessOption("Swimming", "assets/images/swimmingIcon.png"),
    FitnessOption("Workout", "assets/images/barbellIcon.png"),
    FitnessOption("Football", "assets/images/ball-footballIcon.png"),
    FitnessOption("Tennis", "assets/images/ball-tennisIcon.png"),
    FitnessOption("Hiking", "assets/images/mountainIcon.png"),
    FitnessOption("Cycling", "assets/images/bikeIcon.png"),
    FitnessOption("Kayaking", "assets/images/kayakIcon.png"),
  ];

  Set<String> selected = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Add a new Goal",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            Spacer(),
            Icon(Icons.sports_gymnastics_rounded),
            SizedBox(width: 10),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.grey[200], width: 50, height: 5),
                  Container(color: Colors.grey[200], width: 50, height: 5),
                  Container(color: Colors.grey[200], width: 50, height: 5),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Choose the way you want to achieve your goal.",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.pinkAccent,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 10),

              /// Wrap = good for multiple buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: options.map((opt) {
                  final bool isSelected = selected.contains(opt.label);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selected.remove(opt.label);
                        } else {
                          selected.add(opt.label);
                        }
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 20,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.pinkAccent : Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isSelected
                              ? Colors.pinkAccent
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(height: 40, child: Image.asset(opt.image)),
                          const SizedBox(width: 8),
                          Text(
                            opt.label,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey.shade800,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 100),

              /// Continue button
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: selected.isNotEmpty
                      ? () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  WorkoutplanStep4Page(),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected.isNotEmpty
                        ? Colors.pinkAccent
                        : Colors.grey.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class FitnessOption {
  final String label;
  final String image;

  FitnessOption(this.label, this.image);
}
