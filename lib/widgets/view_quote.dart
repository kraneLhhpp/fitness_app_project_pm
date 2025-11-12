import 'package:flutter/material.dart';

class ViewQuote extends StatelessWidget {
  final int index;
  const ViewQuote({super.key, this.index = 0});

  static const List<Map<String, String>> _quotes = [
    {
      'text':
          '“The last three or four reps is what makes the muscle grow. This area of pain divides a champion from someone who is not a champion.”',
      'author': 'Arnold Schwarzenegger',
      'subtitle': 'Bodybuilder, Actor',
      'avatar': 'assets/images/author.png',
    },
    {
      'text':
          '“Strength does not come from physical capacity. It comes from an indomitable will.”',
      'author': 'Mahatma Gandhi',
      'subtitle': 'Leader',
      'avatar': 'assets/images/author2.png',
    },
    {
      'text':
          '“The only bad workout is the one that didn’t happen.”',
      'author': 'Unknown',
      'subtitle': '',
      'avatar': 'assets/images/author3.png',
    },
    {
      'text':
          '“Discipline is doing what needs to be done, even if you don’t want to do it.”',
      'author': 'Unknown',
      'subtitle': '',
      'avatar': 'assets/images/author4.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final q = _quotes[index % _quotes.length];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          q['text']!,
          style: const TextStyle(fontSize: 12, color: Colors.white),
        ),
        const SizedBox(height: 14),
        Row(
          children: [
            if ((q['avatar'] ?? '').isNotEmpty)
              SizedBox(
                width: 42,
                height: 42,
                child: Image.asset(q['avatar']!, fit: BoxFit.cover),
              ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  q['author']!,
                  style: const TextStyle(
                      color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                ),
                if ((q['subtitle'] ?? '').isNotEmpty)
                  Text(q['subtitle']!, style: const TextStyle(fontSize: 12, color: Color(0xFFC6CED9))),
              ],
            ),
          ],
        ),
      ],
    );
  }
}