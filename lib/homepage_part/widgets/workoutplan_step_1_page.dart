import 'package:fitness_app_project/homepage_part/widgets/workoutplan_step_2_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkoutplanStep1Page extends StatefulWidget {
  const WorkoutplanStep1Page({super.key});

  @override
  State<WorkoutplanStep1Page> createState() => _WorkoutplanStep1PageState();
}

class _WorkoutplanStep1PageState extends State<WorkoutplanStep1Page> {
  String? selectedGender;

  bool get isComplete => selectedGender != null;

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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(color: Colors.pinkAccent, width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
                Container(color: Colors.grey[200], width: 50, height: 5),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "First of all, what’s your goal?",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Select what fits best:",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Row(
                  children: [
                    genderButton(
                      "Lose weight",
                      'assets/images/looseWeightIcon.png',
                    ),
                    const SizedBox(width: 12),
                    genderButton(
                      "Gain muscle",
                      'assets/images/gainMuscleIcon.png',
                    ),
                  ],
                ),
                Row(
                  children: [
                    genderButton(
                      "Get fitter",
                      'assets/images/getFitterIcon.png',
                    ),
                    const SizedBox(width: 12),
                    genderButton("Be strong", 'assets/images/bicepss.png'),
                  ],
                ),
              ],
            ),

            Spacer(),

            SizedBox(
              width: double.infinity,
              height: 60,

              child: ElevatedButton(
                onPressed: isComplete
                    ? () {
                        // final user = UserProfile(
                        //   gender: selectedGender!,
                        //   age: age!.round(),
                        //   height: height!.round(),
                        //   weight: weight!.round(),
                        // );
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                WorkoutplanStep2Page(),
                            transitionDuration: Duration.zero,
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                  backgroundColor: isComplete
                      ? Colors.pinkAccent
                      : Colors.grey.shade400,
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

  Widget genderButton(String gender, String image) {
    final selected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = gender),
        child: Container(
          margin: EdgeInsets.all(10),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: selected ? Colors.pinkAccent : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? Colors.pinkAccent : Colors.grey.shade400,
            ),
          ),
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(height: 50, width: 50, child: Image.asset(image)),
              Text(
                gender,
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
