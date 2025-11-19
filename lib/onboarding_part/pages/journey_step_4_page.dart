import 'package:fitness_app_project/onboarding_part/pages/journey_step_5_page.dart';
import 'package:fitness_app_project/onboarding_part/widgets/selectable_option_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyStep4Page extends StatefulWidget {
  const JourneyStep4Page({super.key});

  @override
  State<JourneyStep4Page> createState() => _JourneyStep4PageState();
}

class _JourneyStep4PageState extends State<JourneyStep4Page> {
  int? selectedIndex;

  final List<String> options = [
    "1 time per week",
    "2 times per week",
    "3 times per week",
    "more than 3 times per week",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Step 4",
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
      body: SafeArea(
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
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.pinkAccent, width: 50, height: 5),
                  Container(color: Colors.grey[200], width: 50, height: 5),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "How often do you train?",
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
                "Select what fits best:",
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              /// Dynamic options
              ...List.generate(options.length, (index) {
                return SelectableOption(
                  text: options[index],
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() => selectedIndex = index);
                  },
                );
              }),

              const Spacer(),

              /// Continue button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: selectedIndex != null
                      ? () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  JourneyStep5Page(),
                              transitionDuration: Duration.zero,
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex != null
                        ? Colors.pinkAccent
                        : Colors.pinkAccent.withOpacity(0.3),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Text(
                    "Continue",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
