import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/widgets/bottom_elevated_button.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/quote_header.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        statusBarColor: Colors.transparent
      ),
      child: Scaffold(
        backgroundColor: Color(0xFF1B85F3),
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
                    width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(34),
                          topRight:Radius.circular(34),
                        )
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(height: 20),
                            const Text(
                              'Forgot password?',
                              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Don’t worry! It’s happens. Please enter the email address associated with your account.",
                              style: TextStyle(color: Color(0xFF808B9A)),
                              maxLines: 2,
                            ),    
                            const SizedBox(height: 20),
                            CustomTextField(
                              controller: _emailController, 
                              hintText: 'Insert email address',
                              validator: (v) => v!.isEmpty ? "Email cannot be Empty" : null,
                            ),
                            Spacer(),
                            Builder(
                              builder: (context) {
                                return BottomElevatedButton(
                                  formKey: _formKey,
                                  submitButton: () async{
                                    if (!_formKey.currentState!.validate()) return;

                                      try {
                                        await FirebaseAuth.instance
                                            .sendPasswordResetEmail(email: _emailController.text.trim());

                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(content: Text('Reset link sent to your email'))
                                        );

                                        Navigator.pop(context);

                                      } on FirebaseAuthException catch (e) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(content: Text(e.message ?? 'Error occurred'))
                                        );
                                      }
                                  },
                                );
                              },
                            ),

                          ],
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