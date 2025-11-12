import 'package:fitness_app_project/pages/home_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B85F3),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 255,
              decoration: BoxDecoration(
                color: Color(0xFF1B85F3),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    const ViewQuote(),
                    ViewQuote(index: focusedIndex),
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
                height: double.infinity,
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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 10),
                          const Text(
                            'Login',
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Welcome back! Please enter your details.',
                              style: TextStyle(color: Color(0xFF808B9A)),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            controller: _gmailController,
                            hintText: "example@.com",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 20),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'Remember information',
                              style: TextStyle(color: Color(0xFF808B9A)),
                            ),
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1B85F3),
                              minimumSize: const Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const HomePage())
                                );
                              }
                            },
                            child: const Text(
                              'Join now',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Forget Password?"),
                          ),
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
                                  Image.asset(
                                    'assets/images/ava_google.png',
                                    width: 28,
                                    height: 26,
                                  ),
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
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpPage(),
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
