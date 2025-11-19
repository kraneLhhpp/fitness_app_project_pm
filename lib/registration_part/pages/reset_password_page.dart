import 'package:fitness_app_project/registration_part/widgets/bottom_elevated_button.dart';
import 'package:fitness_app_project/registration_part/widgets/custom_text_field.dart';
import 'package:fitness_app_project/registration_part/widgets/quote_header.dart';
import 'package:fitness_app_project/registration_part/widgets/quotes_swipes.dart';
import 'package:flutter/material.dart';

class ResetPassworPage extends StatefulWidget {
  const ResetPassworPage({super.key});

  @override
  State<ResetPassworPage> createState() => _ResetPassworPageState();
}

class _ResetPassworPageState extends State<ResetPassworPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  late QuotesSwipes _quotesSwipes;

  @override
  void initState() {
    _quotesSwipes = QuotesSwipes(totalQuotes: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 3,
            child: QuoteHeader(
              quotesSwipes: _quotesSwipes,
              onDotTap: (i) => setState(() => _quotesSwipes.currentIndex),
              onSwipeLeft: () => setState(() => _quotesSwipes.swipeLeft()),
              onSwipeRight: () => setState(() => _quotesSwipes.swipeRight()),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Forgot password?',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Don’t worry! It’s happens. Please enter the email address associated with your account.",
                      style: TextStyle(color: Color(0xFF808B9A)),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Insert email address',
                      obscure: true,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Insert email address',
                    ),
                    Spacer(),
                    BottomElevatedButton(
                      formKey: _formKey,
                      submitButton: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
