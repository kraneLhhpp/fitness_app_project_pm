import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app_project/pages/first_screen_page.dart';
import 'package:fitness_app_project/pages/home_page.dart';
import 'package:fitness_app_project/pages/login_page.dart';
import 'package:fitness_app_project/pages/reset_password_page.dart';
import 'package:fitness_app_project/pages/sign_up_page.dart';
import 'package:fitness_app_project/pages/verify_email_page.dart';
import 'package:fitness_app_project/services/firebase_stream.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        }),
      ),
      routes: {
        '/': (context) => const FirebaseStream(),
        '/first_screen': (context) => const FirstScreenPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignUpPage(),
        '/reset_password': (context) => const ResetPassworPage(),
        '/verify_email': (context) => const VerifyEmailScreen(),
      },
      initialRoute: '/',
    );
  }
}