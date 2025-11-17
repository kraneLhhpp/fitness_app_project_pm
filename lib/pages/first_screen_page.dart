import 'package:fitness_app_project/pages/login_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/intro_header.dart';
import 'package:flutter/material.dart';

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({super.key});

  @override
  FirstScreenPageState createState() =>  FirstScreenPageState();
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
      backgroundColor: Color(0xFF1B85F3),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 60,24,24),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 0.9,
                    physics: NeverScrollableScrollPhysics(),              
                    children: [
                      _photo('image1'),
                      _photo('image2'),
                      _photo('image3'),
                      _photo('image4'),
                    ],
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
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)
                      )
                    ),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  const SignUpPage()) 
                      );
                    }, 
                    child: const Text('Join now', style: TextStyle(color: Colors.blue, fontSize: 14)),
                  ),

                  const SizedBox(height: 17),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already a member?', style: TextStyle(color: Colors.white, fontSize: 14)),
                      TextButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage())
                        );
                      }, child: Text('Log in', style: TextStyle(color: Colors.white, fontSize: 14),))
                    ],
                  )
                      ],
                    ) 
                  )
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