import 'package:fitness_app_project/onboarding_part/pages/journey_step_2_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyStep1Page extends StatefulWidget {
  const JourneyStep1Page({super.key});

  @override
  State<JourneyStep1Page> createState() => _JourneyStep1PageState();
}

class _JourneyStep1PageState extends State<JourneyStep1Page> {
  String? selectedGender;
  double? age;
  double? height;
  double? weight;

  bool get isComplete =>
      selectedGender != null && age != null && height != null && weight != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              "Step 1",
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
              "Let us know you better!",
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
              "Your gender:",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                genderButton("Male", Icons.male),
                const SizedBox(width: 12),
                genderButton("Female", Icons.female),
              ],
            ),
            SizedBox(height: 30),
            Text(
              "Age: ${age?.round() ?? '--'}",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pinkAccent,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.pinkAccent,
                overlayColor: Colors.pinkAccent.withOpacity(0.2),
                trackHeight: 4,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                value: age ?? 25,
                min: 10,
                max: 80,
                divisions: 70,
                onChanged: (v) => setState(() => age = v),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Height: ${height?.round() ?? '--'} cm",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pinkAccent,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.pinkAccent,
                overlayColor: Colors.pinkAccent.withOpacity(0.2),
                trackHeight: 4,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                value: height ?? 100,
                min: 100,
                max: 220,
                divisions: 120,
                onChanged: (v) => setState(() => height = v),
              ),
            ),
            SizedBox(height: 50),
            Text(
              "Weight: ${weight?.round() ?? '--'} kg",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.pinkAccent,
                ),
              ),
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.pinkAccent,
                inactiveTrackColor: Colors.grey.shade300,
                thumbColor: Colors.pinkAccent,
                overlayColor: Colors.pinkAccent.withOpacity(0.2),
                trackHeight: 4,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 20),
              ),
              child: Slider(
                value: weight ?? 30,
                min: 30,
                max: 150,
                divisions: 120,
                onChanged: (v) => setState(() => weight = v),
              ),
            ),
            const Spacer(),
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
                                JourneyStep2Page(),
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

  Widget genderButton(String gender, IconData icon) {
    final selected = selectedGender == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedGender = gender),
        child: Container(
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
              Icon(icon),
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
