import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/widgets/quote_header.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/pages/forgot_password_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:flutter/services.dart';

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
  bool isHiddenPassword = true;

  @override
  void initState() {
    _quotesSwipes = QuotesSwipes(totalQuotes: 4);
    super.initState();
  }

  @override
  void dispose() {
    _gmailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> login() async {
  if (!_formKey.currentState!.validate()) return;

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _gmailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, '/home', (_) => false);

  } on FirebaseAuthException catch (e) {
    if (!mounted) return;

    String message = (e.code == 'user-not-found' || e.code == 'wrong-password')
        ? 'Email or password is incorrect'
        : 'Something went wrong';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF1B85F3),
        extendBody: true,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Flexible(
                fit: FlexFit.loose,
                flex: 3,
                child: QuoteHeader(
                    quotesSwipes: _quotesSwipes, 
                    onDotTap: (i) => setState(() => _quotesSwipes.currentIndex = i), 
                    onSwipeLeft: () => setState(() => _quotesSwipes.swipeLeft()), 
                    onSwipeRight: () => setState(() => _quotesSwipes.swipeRight())
                  ),
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
                      padding: const EdgeInsets.only(top: 16, bottom: 30),
                      child: Form(
                        key: _formKey,
                        child:  Column(
                          mainAxisSize: MainAxisSize.min,
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
                              isHiddenPassword: isHiddenPassword,
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
                                login();
                              },
                              child: const Text(
                                'Login',
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
      
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                  side: BorderSide(color: Color(0xFFC8D3E0))
                                )
                              ),
                              onPressed: (){}, 
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/ava_google.png', width: 28, height: 26),
                                  Flexible(
                                    child: Center(
                                      child: Text('Login with Google'),
                                    )
                                  )
                                ],
                              )
                            ),
                            const SizedBox(height: 20),
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
      ),
    );
  }
}
