import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/registration_part/widgets/bottom_elevated_button.dart';
import 'package:fitness_app_project/registration_part/widgets/custom_text_field.dart';
import 'package:fitness_app_project/registration_part/widgets/quote_header.dart';
import 'package:fitness_app_project/registration_part/widgets/quotes_swipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  late QuotesSwipes _quotesSwipes;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _quotesSwipes = QuotesSwipes(totalQuotes: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.pink[50],
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              Flexible(
                flex: 3,
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                  ),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            'Forgot password?',
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.pinkAccent,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Don’t worry! It’s happens. \nPlease enter the email address associated with your account.",
                            style: GoogleFonts.jetBrainsMono(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 20),
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Insert email address',
                            validator: (v) =>
                                v!.isEmpty ? "Email cannot be Empty" : null,
                          ),
                          Spacer(),
                          Builder(
                            builder: (context) {
                              return BottomElevatedButton(
                                formKey: _formKey,
                                submitButton: () async {
                                  if (!_formKey.currentState!.validate()){
                                    return;
                                  }
                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                          email: _emailController.text.trim(),
                                        );
                                    if(!context.mounted) return; 
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Reset link sent to your email',
                                          style: GoogleFonts.jetBrainsMono(
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.pinkAccent,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    if(!context.mounted) return;
                                    Navigator.pop(context);
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          e.message ?? 'Error occurred',
                                        ),
                                      ),
                                    );
                                  }
                                },
                              );
                            },
                          ),
                          SizedBox(height: 20),
                        ],
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
