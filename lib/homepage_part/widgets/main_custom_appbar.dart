import 'package:flutter/material.dart';

class MainCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainCustomAppBar({super.key, required this.text});
  @override
  Size get preferredSize => const Size.fromHeight(70);
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back, color: Colors.grey),
            ),
            SizedBox(width: 2),
            SizedBox(height: 30, child: VerticalDivider(thickness: 1)),
            SizedBox(width: 2),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(Icons.search, color: Colors.grey),
            SizedBox(width: 9),

            SizedBox(height: 30, child: VerticalDivider(thickness: 1)),
            SizedBox(width: 9),
            GestureDetector(
              onTap: () {},
              child: const Icon(Icons.menu, size: 28, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
