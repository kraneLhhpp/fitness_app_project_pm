import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/widgets/completed_task.dart';
import 'package:fitness_app_project/homepage_part/widgets/daily_goals.dart';
import 'package:fitness_app_project/homepage_part/widgets/main_custom_appbar.dart';
import 'package:fitness_app_project/onboarding_part/pages/journey_start_page.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/flutter_percent_indicator.dart';

class GoalsPage extends StatefulWidget {
  final User user;
  const GoalsPage({super.key, required this.user});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final Color customDarkColor = const Color(0xff39434F);
  final Color customBlueColor = const Color(0xff1B85F3);
  final Color buttonColor = const Color(0xff1B85F3);
  final Color shadowLightColor = const Color(0xffEBF2F8);
  final Color shadowMediumColor = const Color(0xffCBE0F6);

  static const double cardHeight = 150;
  static const double shadowOffsetMedium = 10;
  static const double shadowOffsetLight = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainCustomAppBar(text: 'My Goals'),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: 100,
            ),
            children: [
              Text(
                'Do better today with all your goals',
                softWrap: true,
                style: TextStyle(
                  fontSize: 40,
                  wordSpacing: -3,
                  fontWeight: FontWeight.bold,
                  color: customDarkColor,
                ),
                textAlign: TextAlign.start,
              ),
              const SizedBox(height: 24),

              Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: cardHeight,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: shadowLightColor,
                      ),
                      margin: const EdgeInsets.only(top: shadowOffsetLight),
                    ),

                    Container(
                      height: cardHeight,
                      width: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: shadowMediumColor,
                      ),
                      margin: const EdgeInsets.only(top: shadowOffsetMedium),
                    ),

                    Container(
                      height: cardHeight,
                      width: 400,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.pinkAccent,
                      ),
                      margin: const EdgeInsets.only(top: 0),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    'Practice yoga for 7 days',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                LinearPercentIndicator(
                                  backgroundColor: const Color(0xff4f9ff3),
                                  lineHeight: 10,
                                  width: 200,
                                  progressColor: Colors.pink,
                                  percent: 0.23,
                                  barRadius: const Radius.circular(25),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                'assets/images/yogaImage.png',
                                fit: BoxFit.cover,
                                height: 120,
                                width: 120,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    height: 120,
                                    width: 120,
                                    color: Colors.white,
                                    child: Icon(
                                      Icons.self_improvement,
                                      size: 60,
                                      color: Colors.pinkAccent,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Row(
                children: [
                  Text(
                    'Daily Goals',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      wordSpacing: -3,
                      fontWeight: FontWeight.bold,
                      color: customDarkColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const Spacer(),
                  IconButton(
                    icon: Icon(Icons.add, color: buttonColor, size: 30),
                    onPressed: () {
                      print('Add Daily Goal pressed');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const DailyGoals(),
              const SizedBox(height: 16),

              Row(
                children: [
                  Text(
                    'Completed',
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 20,
                      wordSpacing: -3,
                      fontWeight: FontWeight.bold,
                      color: customDarkColor,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
              const CompletedTask(),
              const SizedBox(height: 20),
            ],
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => JourneyStartPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      'Add a new goal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
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
