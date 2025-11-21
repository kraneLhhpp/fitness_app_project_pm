import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AllCoursesPage extends StatefulWidget {
  final User user;
  const AllCoursesPage({super.key, required this.user});

  @override
  State<AllCoursesPage> createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}