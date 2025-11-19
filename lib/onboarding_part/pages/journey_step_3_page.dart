import 'package:fitness_app_project/onboarding_part/pages/journey_step_4_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyStep3Page extends StatefulWidget {
  const JourneyStep3Page({super.key});

  @override
  State<JourneyStep3Page> createState() => _JourneyStep3PageState();
}

class _JourneyStep3PageState extends State<JourneyStep3Page> {
  final List<FitnessOption> options = [
    FitnessOption("Outdoor", Icons.energy_savings_leaf_outlined),
    FitnessOption("Indoor", Icons.apartment_rounded),
    FitnessOption("Home", Icons.home),
    FitnessOption("At the gym", Icons.fitness_center_rounded),
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
              "Step 3",
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.pinkAccent, width: 50, height: 5),
                Container(color: Colors.pinkAccent, width: 50, height: 5),
                Container(color: Colors.pinkAccent, width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Where do you enjoy the most to train?",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Select all that applies:",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 20),

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
                        Icon(
                          opt.icon,
                          color: isSelected ? Colors.white : Colors.grey,
                        ),
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

            const Spacer(),

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
                                JourneyStep4Page(),
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
    );
  }
}

class FitnessOption {
  final String label;
  final IconData icon;

  FitnessOption(this.label, this.icon);
}
