import 'package:fitness_app_project/registration_part/pages/reset_password_page.dart';
import 'package:fitness_app_project/registration_part/widgets/bottom_elevated_button.dart';
import 'package:fitness_app_project/registration_part/widgets/quote_header.dart';
import 'package:fitness_app_project/registration_part/widgets/quotes_swipes.dart';
import 'package:flutter/material.dart';

class CodeValidationPage extends StatefulWidget {
  const CodeValidationPage({super.key});

  @override
  State<CodeValidationPage> createState() => _CodeValidationPageState();
}

class _CodeValidationPageState extends State<CodeValidationPage> {
  late QuotesSwipes _quotesSwipes;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: QuoteHeader(
                quotesSwipes: _quotesSwipes,
                onDotTap: (i) => setState(() => _quotesSwipes.currentIndex = i),
                onSwipeLeft: () => setState(() => _quotesSwipes.swipeLeft()),
                onSwipeRight: () => setState(() => _quotesSwipes.swipeRight()),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
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
                        'Code validation',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Please enter the 4 digit code sent to your \nmobile number +40 700 000 000",
                        style: TextStyle(color: Color(0xFF808B9A)),
                        maxLines: 2,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Joined us before?"),
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              "Login",
                              style: TextStyle(color: Color(0xFF1B85F3)),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Builder(
                        builder: (context) {
                          return BottomElevatedButton(
                            formKey: _formKey,
                            submitButton: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ResetPassworPage(),
                                ),
                              );
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
    );
  }
}
