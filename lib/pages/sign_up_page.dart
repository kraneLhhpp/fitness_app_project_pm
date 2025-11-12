import 'package:fitness_app_project/pages/home_page.dart';
import 'package:fitness_app_project/pages/login_page.dart';
import 'package:fitness_app_project/widgets/custom_text_field.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final String errorText = "Fill the field";
  final _formKey = GlobalKey<FormState>();
  int focusedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 260,
              decoration: BoxDecoration(
                color: const Color(0xFF1B85F3)
              ),
              child: Padding(
                padding: const EdgeInsets.all(14),
                child: Column(
                  children: [
                    Expanded(
                      child: ViewQuote()
                    ),
                    Expanded(
                      child: ViewQuote(index: focusedIndex,) 
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(4, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              focusedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: DotImage(isFocused: focusedIndex == index),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Container(
                height: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView( 
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 20),
                          const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Hello there! Let’s create your account.",
                            style: TextStyle(color: Color(0xFF808B9A)),
                          ),
                          const SizedBox(height: 20),
                      
                          CustomTextField(
                            hintText: 'First Name', 
                            controller: _fNameController,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Name cannot be empty";
                              }
                              return null;
                            }, 
                            onChanged: (value){
                              setState(() {});
                            },
                          ),
                      
                          const SizedBox(height: 10), 
                      
                          CustomTextField(
                            hintText: 'Last Name', 
                            controller: _lNameController,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Name cannot be empty";
                              }
                              return null;
                            }, 
                            onChanged: (value){
                              setState(() {});
                            },
                          ),
                          const SizedBox(height: 10),
                      
                          CustomTextField(
                            hintText: 'Email address', 
                            controller: _emailController,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Email cannot be empty";
                              }
                              return null;
                            }, 
                            onChanged: (value){
                              setState(() {});
                            },
                          ),
                      
                          const SizedBox(height: 10),
                      
                          CustomTextField(
                            hintText: 'Phone number', 
                            controller: _phoneNumberController,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Phone number cannot be empty";
                              }
                              return null;
                            }, 
                            onChanged: (value){
                              setState(() {});
                            },
                          ),
                      
                          const SizedBox(height: 10),
                      
                          CustomTextField(
                            obscure: true,
                            hintText: 'Password', 
                            controller: _passwordController,
                            validator: (value){
                              if(value == null || value.isEmpty){
                                return "Email cannot be empty";
                              }
                              return null;
                            }, 
                            onChanged: (value){
                              setState(() {});
                            },
                          ),
                      
                          const SizedBox(height: 15),
                      
                          Align(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              'I agree to Platform Terms of Service and\nPrivacy Policy',
                              style: TextStyle(color: Color(0xFF808B9A)),
                            ),
                          ),
                      
                          const SizedBox(height: 15),
                      
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1B85F3),
                              minimumSize: const Size(double.infinity, 55),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {
                              if(_formKey.currentState!.validate()){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomePage(),
                                    ),
                                  );
                              }
                            },
                            child: const Text(
                              'Create account',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                      
                          const SizedBox(height: 30),
                      
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Joined us before?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Login',
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


