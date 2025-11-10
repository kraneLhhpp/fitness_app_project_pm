import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B85F3),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF0C4180),
                      ),
                      height: 180,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text('“The last three or four reps is what makes the muscle'
                                        '\ngrow.This area of pain divides a champion from'
                                        '\nsomeone who is not a champion'
                                        "\n That's what most people lack — having the guts to go on"
                                        "\nand just say they'll go through the pain no matter what "
                                        "\nhappens. That's what makes a champion.",
                                        style: TextStyle(fontSize: 12, color: Colors.white),
                            ),
                            const SizedBox(height: 14),
                        
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 42,
                                  height: 42,
                                  child: Image.asset('assets/images/author.png', fit: BoxFit.cover),
                                ),
                        
                                const SizedBox(width: 15),
                        
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const[
                                    Text('Arnold Schwarzenegger', 
                                          style: TextStyle(
                                            color: Colors.white, 
                                            fontSize: 14, 
                                            fontWeight: FontWeight.bold
                                          )
                                    ),
                                    Text('Bodybuilder, Actor', style: TextStyle(fontSize: 12,color: Color(0xFFC6CED9)))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
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
                  ],
                ),
              ),
            ),
            Expanded(
  child: Container(
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
        topRight: Radius.circular(34),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            const Text('Login', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),

            const Text(
              'Welcome back! Please enter your details.',
              style: TextStyle(color: Color(0xFF808B9A)),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _gmailController,
              decoration: InputDecoration(
                hintText: 'example@gmail.com',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                ),
              ),
            ),
            const SizedBox(height: 20),

            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility, color: Colors.grey),
                ),
                hintText: 'Password',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text('Remember information', style: TextStyle(color: Color(0xFF808B9A))),
            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B85F3),
                minimumSize: const Size(double.infinity, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () {}, // 👈 убрал синтаксическую ошибку "_(){}"
              child: const Text(
                'Join now',
                style: TextStyle(color: Colors.white),
              ),
            ),

            const SizedBox(height: 10),
            TextButton(onPressed: () {}, child: const Text("Forget Password?")),
            const SizedBox(height: 18),
            const Text('or', style: TextStyle(color: Color(0xFF808B9A))),
            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFD9DFE6),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/ava_google.png', width: 28, height: 26),
                    const SizedBox(width: 80),
                    const Text('Login with Google'),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("First time here?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign up for free',
                    style: TextStyle(color: Color(0xFF1B85F3)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ),
  ),
)
          ],
        )
      ),
    );
  }
}