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
                const SizedBox(height: 20),

                // FIRST NAME
                TextFormField(
                  controller: _fName,
                  decoration: const InputDecoration(labelText: "First Name"),
                  validator: (v) =>
                      v!.isEmpty ? "Please enter your first name" : null,
                ),
                const SizedBox(height: 12),

                // LAST NAME
                TextFormField(
                  controller: _lName,
                  decoration: const InputDecoration(labelText: "Last Name"),
                  validator: (v) =>
                      v!.isEmpty ? "Please enter your last name" : null,
                ),
                const SizedBox(height: 12),

                // EMAIL
                TextFormField(
                  controller: _email,
                  decoration: const InputDecoration(labelText: "Email"),
                  validator: (email) =>
                      email != null && !EmailValidator.validate(email)
                      ? "Invalid email"
                      : null,
                ),
                const SizedBox(height: 12),

                // PHONE
                TextFormField(
                  controller: _phone,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  validator: (v) => v!.isEmpty ? "Phone number required" : null,
                ),
                const SizedBox(height: 12),

                // PASSWORD
                TextFormField(
                  controller: _password,
                  obscureText: isHiddenPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    suffixIcon: IconButton(
                      icon: Icon(
                        isHiddenPassword
                            ? Icons.visibility_off
                            : Icons.visibility,
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
