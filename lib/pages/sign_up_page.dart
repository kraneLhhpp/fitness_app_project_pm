import 'package:flutter/material.dart';
import 'package:fitness_app_project/pages/home_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

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

            /// ★★★★★ ADAPTIVE TOP AREA ★★★★★
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
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
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
                          (index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                _quotesSwipes.currentIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: DotImage(isFocused: _quotesSwipes.currentIndex == index),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            /// ★★★★★ ADAPTIVE FORM AREA ★★★★★
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
                    padding: const EdgeInsets.only(top: 20, bottom: 40),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [

                          const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 4),

                          const Text(
                            "Hello there! Let’s create your account.",
                            style: TextStyle(color: Color(0xFF808B9A)),
                          ),

                          const SizedBox(height: 20),

                          CustomTextField(
                            hintText: 'First Name',
                            controller: _fNameController,
                            validator: (v) => v!.isEmpty ? "Field cannot be empty" : null,
                          ),

                          const SizedBox(height: 12),

                          CustomTextField(
                            hintText: 'Last Name',
                            controller: _lNameController,
                            validator: (v) => v!.isEmpty ? "Field cannot be empty" : null,
                          ),

                          const SizedBox(height: 12),

                          CustomTextField(
                            hintText: 'Email',
                            controller: _emailController,
                            validator: (v) => v!.isEmpty ? "Email cannot be empty" : null,
                          ),

                          const SizedBox(height: 12),

                          CustomTextField(
                            hintText: 'Phone number',
                            controller: _phoneController,
                            validator: (v) => v!.isEmpty ? "Phone cannot be empty" : null,
                          ),

                          const SizedBox(height: 12),

                          CustomTextField(
                            obscure: true,
                            hintText: 'Password',
                            controller: _passwordController,
                            validator: (v) => v!.isEmpty ? "Password cannot be empty" : null,
                          ),

                          const SizedBox(height: 20),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'I agree to Terms and Privacy Policy',
                              style: TextStyle(color: Color(0xFF808B9A)),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B85F3),
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
                            child: const Text("Create account", style: TextStyle(color: Colors.white)),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Joined us before?"),
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Login", style: TextStyle(color: Color(0xFF1B85F3))),
                              ),
                            ],
                          ),
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
