import 'package:flutter/material.dart';
import 'package:fitness_app_project/pages/stats_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(70);

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
                  MaterialPageRoute(builder: (context) => const StatsScreen()),
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
                    children: const <Widget>[
                      Text(
                        'Hello,',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        'Thomas',
                        style: TextStyle(
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
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
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
