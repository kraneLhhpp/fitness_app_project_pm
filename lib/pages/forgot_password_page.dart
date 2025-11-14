import 'package:fitness_app_project/pages/first_screen_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      backgroundColor: Color(0xFF1B85F3),
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  setState(() {
                    if (details.primaryVelocity! < 0) {
                      _quotesSwipes.swipeLeft();
                    } else if (details.primaryVelocity! > 0) {
                      _quotesSwipes.swipeRight();
                    }
                  });
                },
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF1B85F3),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      ViewQuote(index: _quotesSwipes.currentIndex),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _quotesSwipes.totalQuotes,
                          (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _quotesSwipes.currentIndex = index;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: DotImage(
                                  isFocused:
                                      _quotesSwipes.currentIndex == index,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ),
            Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  )
                ),
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight:Radius.circular(34),
                    )
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        CustomTextField(controller: _emailController, hintText: 'Insert email address'),
                      ],
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 24, 
          right: 24,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF1B85F3),
            minimumSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ), 
          ),
          onPressed: (){
            if(_formKey.currentState!.validate()){
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => const FirstScreenPage())
              );
            }
          }, 
          child: Text('Submit', style: TextStyle(color: Colors.white, fontSize: 24)),
        ),
      ),
    );
  }
}