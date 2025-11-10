import 'package:fitness_app_project/pages/login_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:flutter/material.dart';

class FirstScreenPage extends StatefulWidget {
  const FirstScreenPage({super.key});

  @override
  FirstScreenPageState createState() =>  FirstScreenPageState();
}

class FirstScreenPageState extends State<FirstScreenPage> {
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B85F3),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 400,
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

            const SizedBox(height: 70),

            const Text('Fitness as a lifestyle', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            const Text('The perfect place to track your workouts and improve your fitness!', 
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 14,
                        )
                      ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      focusedIndex = index;
                    });
                  },
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: DotImage(isFocused: focusedIndex == index),
                  ),
                );
              }),
            )
,            const SizedBox(height: 30),

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