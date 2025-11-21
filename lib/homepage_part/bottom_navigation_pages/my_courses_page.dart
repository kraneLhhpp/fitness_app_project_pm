import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyCoursesPage extends StatefulWidget {
  final User user;
  const MyCoursesPage({super.key, required this.user});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}