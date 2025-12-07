import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();

  final _fName = TextEditingController();
  final _lName = TextEditingController();
  final _email = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  bool isHiddenPassword = true;

  @override
  void dispose() {
    _fName.dispose();
    _lName.dispose();
    _email.dispose();
    _phone.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    if (!_formKey.currentState!.validate()) return;

    try {
      // REGISTER USER
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: _email.text.trim(),
            password: _password.text.trim(),
          );

      User? user = cred.user;

      // UPDATE NAME
      await user?.updateDisplayName(
        "${_fName.text.trim()} ${_lName.text.trim()}",
      );

      // SEND EMAIL VERIFICATION
      await user?.sendEmailVerification();

      if (!mounted) return;

      // GO TO VERIFY PAGE
      Navigator.pushNamed(context, '/verify_email');
    } on FirebaseAuthException catch (e) {
      String message = "Something went wrong";

      if (e.code == "email-already-in-use") {
        message = "This email is already registered";
      } else if (e.code == "invalid-email") {
        message = "Email format is invalid";
      } else if (e.code == "weak-password") {
        message = "Password must be at least 6 characters";
      } else if (e.code == "operation-not-allowed") {
        message = "Email/password sign-in disabled in Firebase";
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.pinkAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 40),

                Text(
                  "Sign Up",
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Expanded(
                  flex: 10,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Text(
                                'Sign up',
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
          
                              Text(
                                "Hello there! Let’s create your account.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
          
                              const SizedBox(height: 20),
          
                              CustomTextField(
                                hintText: 'First Name',
                                controller: _fNameController,
                                validator: (v) =>
                                    v!.isEmpty ? "Field cannot be empty" : null,
                              ),
          
                              const SizedBox(height: 12),
          
                              CustomTextField(
                                hintText: 'Last Name',
                                controller: _lNameController,
                                validator: (v) =>
                                    v!.isEmpty ? "Field cannot be empty" : null,
                              ),
          
                              const SizedBox(height: 12),
          
                              CustomTextField(
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                validator: (email) =>
                                    email != null && !EmailValidator.validate(email)
                                    ? "Input correct email"
                                    : null,
                              ),
          
                              const SizedBox(height: 12),
          
                              CustomTextField(
                                keyboardType: TextInputType.phone,
                                hintText: 'Phone number',
                                controller: _phoneController,
                                validator: (v) =>
                                    v!.isEmpty ? "Phone cannot be empty" : null,
                              ),
          
                              const SizedBox(height: 12),
          
                              CustomTextField(
                                obscure: true,
                                hintText: 'Password',
                                controller: _passwordController,
                                validator: (v) =>
                                    v!.isEmpty ? "Password cannot be empty" : null,
                                isHiddenPassword: isHiddenPassword,
                                togglePasswordView: togglePasswordView,
                              ),
          
                              const SizedBox(height: 20),
          
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'I agree to Terms and Privacy Policy',
                                  style: GoogleFonts.jetBrainsMono(
                                    textStyle: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  textAlign: TextAlign.center,
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
                                  signUp();
                                },
                                child: const Text(
                                  "Create account",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
          
                              const SizedBox(height: 10),
          
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Joined us before?",
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const LoginPage(),
                                        ),
                                      );
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.jetBrainsMono(
                                        textStyle: const TextStyle(
                                          color: Colors.pinkAccent,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          isHiddenPassword = !isHiddenPassword;
                        });
                      },
                    ),
                  ),
                  validator: (v) => v!.isEmpty ? "Password required" : null,
                ),

                const SizedBox(height: 30),

                // SIGNUP BUTTON
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    minimumSize: const Size(double.infinity, 55),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: signUp,
                  child: const Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(height: 20),

                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: const Text("Already have an account? Login"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
