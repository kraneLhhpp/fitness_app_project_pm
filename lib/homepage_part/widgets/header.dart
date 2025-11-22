import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/main_menu_pages/stats_screen.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final User user;

  const CustomAppBar({super.key, required this.user});

  @override
  Size get preferredSize => const Size.fromHeight(70);

  String get userName {
    return user.displayName ?? user.email?.split('@').first ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StatsScreen(user: user),
                  ),
                );
              },
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/avatarImg.png'),
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Hello,',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                const Icon(Icons.search, size: 28),
                SizedBox(
                  height: 24,
                  child: VerticalDivider(
                    thickness: 1,
                    color: Colors.grey.shade300,
                    width: 20,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.menu, size: 28),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
