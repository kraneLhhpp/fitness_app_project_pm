import 'package:fitness_app_project/registration_part/pages/login_page.dart';
import 'package:fitness_app_project/registration_part/pages/sign_up_page.dart';
import 'package:fitness_app_project/registration_part/widgets/intro_header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({super.key});

  @override
  FirstScreenPageState createState() => FirstScreenPageState();
}

class FirstScreenPageState extends State<FirstScreenPage> {
  int focusedIndex = 0;

  List<String> titles = [
    "Fitness as a lifestyle",
    "Track your progress",
    "Train smarter",
    "Achieve your goals",
  ];

  List<String> subtitles = [
    "The perfect place to track your workouts and improve your fitness!",
    "Keep all your workouts organized and visible!",
    "Use powerful tools to maximize your performance!",
    "Start your journey to becoming the best version of yourself!",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 60, 24, 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: GridView.count(
                    crossAxisCount: 1,
                    childAspectRatio: 0.8,
                    physics: NeverScrollableScrollPhysics(),
                    children: [_photo('fitQuest')],
                  ),
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IntroHeader(
                    currentIndex: focusedIndex,
                    titles: titles,
                    subtitles: subtitles,
                    onDotTap: (i) => setState(() => focusedIndex = i),
                    onSwipeLeft: () => setState(() {
                      if (focusedIndex < titles.length - 1) focusedIndex++;
                    }),
                    onSwipeRight: () => setState(() {
                      if (focusedIndex > 0) focusedIndex--;
                    }),
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 54),
                      backgroundColor: Colors.pinkAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Join now',
                      style: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 17),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already a member?',
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Log in',
                          style: GoogleFonts.jetBrainsMono(
                            textStyle: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.pinkAccent,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _photo(String asset) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset('assets/images/$asset.png', fit: BoxFit.cover),
    );
  }
}
