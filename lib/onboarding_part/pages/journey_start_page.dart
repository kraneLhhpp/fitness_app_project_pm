import 'package:fitness_app_project/onboarding_part/pages/journey_step_1_page.dart';
import 'package:fitness_app_project/onboarding_part/widgets/custom_action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JourneyStartPage extends StatelessWidget {
  const JourneyStartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 90),
            Image.asset('assets/images/fitQuest_white.png'),
            SizedBox(height: 20),
            Text(
              'Give us a chance to personalize your journey',
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Simplify your journey through our smart configurator.',
              textAlign: TextAlign.center,
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 50),
            CustomActionButton(
              text: 'Start',
              backgroundColor: Colors.pinkAccent,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const JourneyStep1Page(),
                  ),
                );
              },
            ),
            SizedBox(height: 20),
            CustomActionButton(
              text: 'Skip for now',
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
