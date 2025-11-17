import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool isEmailVerified = false;
  bool canResendEmail = false;
  Timer? timer;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _initVerification();
  }

  Future<void> _initVerification() async {
    final user = FirebaseAuth.instance.currentUser;

    // Если пользователя нет → НАЗАД
    if (user == null) {
      logger.e("INIT: User is NULL → Pop screen");
      if (mounted) Navigator.pop(context);
      return;
    }

    // Проверяем состояние
    isEmailVerified = user.emailVerified;

    if (!isEmailVerified) {
      await sendVerificationEmail();

      // Проверяем каждые 3 секунды
      timer = Timer.periodic(
        const Duration(seconds: 3),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkEmailVerified() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      logger.e("CHECK: User is NULL");
      return;
    }

    await user.reload();
    final updatedUser = FirebaseAuth.instance.currentUser;

    final verified = updatedUser?.emailVerified ?? false;

    if (!mounted) return;
    setState(() => isEmailVerified = verified);

    logger.i("Email verified: $isEmailVerified");

    if (verified) timer?.cancel();
  }

  Future<void> sendVerificationEmail() async {
    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        logger.e("SEND: User NULL — cannot send email");
        return;
      }

      await user.sendEmailVerification();
      logger.i("Verification email sent");

      if (!mounted) return;

      setState(() => canResendEmail = false);

      await Future.delayed(const Duration(seconds: 5));

      if (!mounted) return;

      setState(() => canResendEmail = true);
    } catch (e) {
      logger.e("Error sending email: $e");

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEmailVerified) return const HomePage();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Верификация Email адреса'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Письмо с подтверждением было отправлено на вашу почту.',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: canResendEmail ? sendVerificationEmail : null,
                icon: const Icon(Icons.email),
                label: const Text('Отправить снова'),
              ),

              const SizedBox(height: 20),

              TextButton(
                onPressed: () async {
                  timer?.cancel();
                  final user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    try {
                      await user.delete();
                    } catch (e) {
                      logger.e("Error deleting user: $e");
                    }
                  }

                  if (mounted) Navigator.pop(context);
                },
                child: const Text(
                  'Отменить регистрацию',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
