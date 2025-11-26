import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/bottom_navigation.dart';
import 'package:fitness_app_project/registration_part/widgets/quote_header.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/registration_part/pages/forgot_password_page.dart';
import 'package:fitness_app_project/registration_part/pages/sign_up_page.dart';
import 'package:fitness_app_project/registration_part/widgets/custom_text_field.dart';
import 'package:fitness_app_project/registration_part/widgets/quotes_swipes.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

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

      final user = FirebaseAuth.instance.currentUser;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => BottomNavigation(user: user!)),
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      String message =
          (e.code == 'user-not-found' || e.code == 'wrong-password')
          ? 'Email or password is incorrect'
          : 'Something went wrong';

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        extendBody: true,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    flex: 4,
                    child: QuoteHeader(
                      quotesSwipes: _quotesSwipes,
                      onDotTap: (i) =>
                          setState(() => _quotesSwipes.currentIndex = i),
                      onSwipeLeft: () => setState(() => _quotesSwipes.swipeLeft()),
                      onSwipeRight: () =>
                          setState(() => _quotesSwipes.swipeRight()),
                    ),
                  ),
            
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(32),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.only(top: 16, bottom: 30),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Login',
                                  style: GoogleFonts.jetBrainsMono(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Welcome back! Please enter your details.',
                                  style: GoogleFonts.jetBrainsMono(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
            
                                const SizedBox(height: 20),
            
                                CustomTextField(
                                  controller: _gmailController,
                                  hintText: "example@gmail.com",
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                      ? 'Email cannot be empty'
                                      : null,
                                ),
            
                                const SizedBox(height: 14),
            
                                CustomTextField(
                                  controller: _passwordController,
                                  hintText: "Password",
                                  obscure: true,
                                  validator: (value) =>
                                      value == null || value.isEmpty
                                      ? 'Password cannot be empty'
                                      : null,
                                  isHiddenPassword: isHiddenPassword,
                                  togglePasswordView: togglePasswordView,
                                ),
            
                                const SizedBox(height: 20),
            
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Remember information",
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
            
                                const SizedBox(height: 20),
            
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pinkAccent,
                                    minimumSize: const Size(double.infinity, 55),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                  ),
                                  onPressed: () {
                                    login();
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
            
                                const SizedBox(height: 10),
            
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Forget Password?",
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.pinkAccent,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
            
                                const SizedBox(height: 10),
            
                                Text(
                                  'or',
                                  style: GoogleFonts.jetBrainsMono(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
            
                                const SizedBox(height: 16),
            
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(24),
                                      side: BorderSide(color: Color(0xFFC8D3E0)),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/ava_google.png',
                                        width: 28,
                                        height: 26,
                                      ),
                                      Flexible(
                                        child: Center(
                                          child: Text(
                                            'Login with Google',
                                            style: GoogleFonts.jetBrainsMono(
                                              textStyle: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "First time here?",
                                      style: GoogleFonts.jetBrainsMono(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                const SignUpPage(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Sign up for free",
                                        style: GoogleFonts.jetBrainsMono(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.pinkAccent,
                                            fontSize: 14,
                                          ),
                                        ),
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
        ),
      ),
    );
  }
}
