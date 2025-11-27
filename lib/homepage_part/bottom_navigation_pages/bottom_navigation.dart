import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/home_page.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/all_courses_page.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/my_courses_page.dart';
import 'package:fitness_app_project/homepage_part/bottom_navigation_pages/profile_page.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigation extends StatefulWidget {
  final User user;

  const BottomNavigation({super.key, required this.user});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(user: widget.user),
      MyCoursesPage(user: widget.user),
      AllCoursesPage(user: widget.user),
      ProfilePage(user: widget.user),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,

        selectedLabelStyle: GoogleFonts.jetBrainsMono(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: GoogleFonts.jetBrainsMono(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),

        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'My Courses'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'All Courses'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
