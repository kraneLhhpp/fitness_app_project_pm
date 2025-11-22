import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  bool canResendEmail = false;
  Timer? timer;
  final logger = Logger();

  @override
  void initState() {
    super.initState();
    _initVerification();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> _initVerification() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      logger.e("INIT: User is NULL → Pop screen");
      if (mounted) Navigator.pop(context);
      return;
    }

    // Немедленно проверяем, подтверждена ли почта
    if (user.emailVerified) {
      logger.i("INIT: Email already verified → Navigating to home");
      _navigateToHome();
      return;
    }

    // Если не подтверждена, отправляем письмо и запускаем таймер
    await sendVerificationEmail();
    timer = Timer.periodic(
      const Duration(seconds: 3),
      (_) => checkEmailVerified(),
    );
  }

  void _navigateToHome() {
    if (!mounted) return;
    // Переход на домашнюю страницу с удалением всех предыдущих экранов из стека.
    // Пользователь не сможет вернуться на экраны верификации или входа.
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (Route<dynamic> route) => false,
    );
  }

  Future<void> checkEmailVerified() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      logger.e("CHECK: User is NULL");
      timer?.cancel();
      if (mounted)
        Navigator.pop(context); // Возвращаемся, если пользователь исчез
      return;
    }

    await user.reload();
    final updatedUser = FirebaseAuth
        .instance
        .currentUser; // Повторно получаем после перезагрузки

    if (updatedUser?.emailVerified ?? false) {
      timer?.cancel();
      logger.i("CHECK: Email has been verified → Navigating to home");
      _navigateToHome();
    } else {
      logger.i("CHECK: Email not verified yet.");
    }
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
        const SnackBar(content: Text('Не удалось отправить письмо')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Мы убрали условный возврат. Этот экран теперь показывает только UI верификации.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Верификация Email адреса')),
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
