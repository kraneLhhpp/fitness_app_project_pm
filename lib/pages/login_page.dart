import 'package:flutter/material.dart';
import 'package:fitness_app_project/pages/forgot_password_page.dart';
import 'package:fitness_app_project/pages/home_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _gmailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  late QuotesSwipes _quotesSwipes;

  @override
  void initState() {
    _quotesSwipes = QuotesSwipes(totalQuotes: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1B85F3),
      body: SafeArea(
        child: Column(
          children: [

            /// ★★★★★ ADAPTIVE TOP QUOTE AREA ★★★★★
            Flexible(
              flex: 3,
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  setState(() {
                    if (details.primaryVelocity! < 0) {
                      _quotesSwipes.swipeLeft();
                    } else {
                      _quotesSwipes.swipeRight();
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder: (child, animation) {
                            return SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0.2, 0),
                                end: Offset.zero
                              ).animate(animation),
                              child: FadeTransition(
                                opacity: animation,
                                child: child, 
                              ),
                            );
                          },
                          child: ViewQuote(
                            key: ValueKey(_quotesSwipes.currentIndex),
                            index: _quotesSwipes.currentIndex,
                          ),
                        )
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _quotesSwipes.totalQuotes,
                          (i) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _quotesSwipes.currentIndex = i;
                                });
                              },
                              child: DotImage(
                                isFocused: _quotesSwipes.currentIndex == i,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            /// ★★★★★ ADAPTIVE LOGIN FORM AREA ★★★★★
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(top: 16, bottom: 30),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Login',
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Welcome back! Please enter your details.',
                            style: TextStyle(color: Color(0xFF808B9A)),
                          ),

                          const SizedBox(height: 20),

                          CustomTextField(
                            controller: _gmailController,
                            hintText: "example@gmail.com",
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Email cannot be empty' : null,
                          ),

                          const SizedBox(height: 14),

                          CustomTextField(
                            controller: _passwordController,
                            hintText: "Password",
                            obscure: true,
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Password cannot be empty' : null,
                          ),

                          const SizedBox(height: 20),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Remember information",
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
                              if (_formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
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
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const ForgotPasswordPage()),
                              );
                            },
                            child: const Text("Forget Password?"),
                          ),

                          const SizedBox(height: 14),

                          const Text('or', style: TextStyle(color: Color(0xFF808B9A))),

                          const SizedBox(height: 16),

                          /// LOGIN WITH GOOGLE BUTTON
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            height: 48,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD9DFE6),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Row(
                              children: [
                                Image.asset('assets/images/ava_google.png', width: 28, height: 26),
                                const Spacer(),
                                const Text("Login with Google"),
                                const Spacer(flex: 2),
                              ],
                            ),
                          ),

                          const SizedBox(height: 28),

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
                                  "Sign up for free",
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
