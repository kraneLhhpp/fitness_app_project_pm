import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B85F3),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF0C4180),
                      ),
                      height: 180,
                      width: 350,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            const Text(
                              '“The last three or four reps is what makes the muscle'
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
                                  children: const [
                                    Text(
                                      'Arnold Schwarzenegger',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Bodybuilder, Actor',
                                      style: TextStyle(fontSize: 12, color: Color(0xFFC6CED9)),
                                    )
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
                    ),
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
                        const SizedBox(height: 20),
                        const Text(
                          'Login',
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Hello there! Let’s create your account.",
                          style: TextStyle(color: Color(0xFF808B9A)),
                        ),
                        const SizedBox(height: 20),

                        TextField(
                          decoration: InputDecoration(
                            hintText: 'First Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10), 

                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Last Name',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Email address',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone number',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14),
                              borderSide: const BorderSide(color: Color(0xFF1B85F3)),
                            ),
                          ),
                        ),

                        const SizedBox(height: 10),

                        TextField(
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

                        const SizedBox(height: 15),

                        const Text(
                          'I agree to Platform Terms of Service and\nPrivacy Policy',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF808B9A)),
                        ),

                        const SizedBox(height: 15),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1B85F3),
                            minimumSize: const Size(double.infinity, 55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Create account',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        const SizedBox(height: 30),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Joined us before?"),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Login',
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
            ),
          ],
        ),
      ),
    );
  }
}
