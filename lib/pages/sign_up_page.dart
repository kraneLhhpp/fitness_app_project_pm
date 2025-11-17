import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/pages/login_page.dart';
import 'package:fitness_app_project/widgets/quote_header.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';


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
  bool isHiddenPassword = true;

  @override
  void initState() {
    _quotesSwipes = QuotesSwipes(totalQuotes: 4);
    super.initState();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  @override
  void dispose() {
    _fNameController.dispose();
    _lNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
  if (!_formKey.currentState!.validate()) return;

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return; 
      Navigator.pushNamed(context, '/verify_email');

  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

     print("FIREBASE ERROR: ${e.code} — ${e.message}");

    String message = 'Something went wrong';
    if (e.code == 'email-already-in-use') {
      message = 'Email is already in use';
    }

     if (e.code == 'email-already-in-use') {
    message = 'Email is already in use';
  }

  if (e.code == 'weak-password') {
    message = 'Password must be at least 6 characters';
  }

  if (e.code == 'invalid-email') {
    message = 'Invalid email format';
  }

  if (e.code == 'operation-not-allowed') {
    message = 'Email/password sign-in is disabled in Firebase';
  }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF1B85F3),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Flexible(
              flex: 3,
              child: QuoteHeader(
                quotesSwipes: _quotesSwipes, 
                onDotTap: (i) => setState(() => _quotesSwipes.currentIndex = i), 
                onSwipeLeft: () => setState(() => _quotesSwipes.swipeLeft()), 
                onSwipeRight: () => setState(() => _quotesSwipes.swipeRight())
              )
            ),
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
                            validator: (email) => 
                             email != null && !EmailValidator.validate(email)
                                ? "Input correct email"
                                : null
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
                            isHiddenPassword:isHiddenPassword,
                            togglePasswordView: togglePasswordView
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

                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B85F3),
                              minimumSize: const Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              signUp();
                            },
                            child: const Text("Create account", style: TextStyle(color: Colors.white)),
                          ),

                          const SizedBox(height: 24),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Joined us before?"),
                              TextButton(
                                onPressed: (){
                                  Navigator.push(
                                    context, 
                                    MaterialPageRoute(builder: (context) => const LoginPage())
                                  );
                                },
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
