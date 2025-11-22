import 'package:flutter/material.dart';

class DarkHeader extends StatelessWidget {
  const DarkHeader({super.key});

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
              children: const [
                Text('Hello,', style: TextStyle(color: Colors.grey)),
                Text(
                  'Thomas',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
