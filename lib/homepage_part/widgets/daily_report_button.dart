import 'package:fitness_app_project/homepage_part/main_menu_pages/daily_reports_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyReportsButton extends StatelessWidget {
  const DailyReportsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.pinkAccent),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Daily Reports',
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              ),
              Text(
                'All your details in a single place.',
                style: GoogleFonts.jetBrainsMono(
                  textStyle: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),
            ],
          ),

          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DailyReportsPage()),
              );
            },
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.arrow_forward, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
