import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkHeader extends StatelessWidget {
  const DarkHeader({super.key, required this.user});
  final User user;
  String get userName {
    return user.displayName ?? user.email?.split('@').first ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/avatarImg.png'),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello,',
                  style: GoogleFonts.jetBrainsMono(
                    textStyle: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
                Text(
                  userName,
                  style: GoogleFonts.jetBrainsMono(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.search, color: Colors.white, size: 28),
            SizedBox(
              height: 20,
              child: VerticalDivider(
                thickness: 1,
                color: Colors.white,
                width: 20,
              ),
            ),
            Icon(Icons.menu, color: Colors.white, size: 28),
          ],
        ),
      ],
    );
  }
}
