import 'package:flutter/material.dart';

class ViewQuote extends StatelessWidget {
  final int index;
  const ViewQuote({super.key, this.index = 0});

  static const List<Map<String, String>> _quotes = [
    {
      'text': "“The last three or four reps is what makes the muscle grow.\n"
          "This area of pain divides a champion from someone who is not a champion.\n"
          "That’s what most people lack — having the guts to go on and say they’ll "
          "go through the pain no matter what happens.\n"
          "That’s what makes a champion.”",
      'author': 'Arnold Schwarzenegger',
      'subtitle': 'Bodybuilder, Actor',
      'avatar': 'assets/images/author.png',
    },
    {
      'text':
          '“Be the hardest worker in the room. It’s not about talent — it’s about effort.\n'
              'When you’re tired and feel like you can’t push further — that’s when you grow.”',
      'author': 'Dwayne "The Rock" Johnson',
      'subtitle': 'Actor, Athlete',
      'avatar': 'assets/images/rock.png',
    },
    {
      'text':
          '“I hated every minute of training, but I said, ‘Don’t quit.’\n'
              'Suffer now and live the rest of your life as a champion.”',
      'author': 'Muhammad Ali',
      'subtitle': 'Boxer, Champion',
      'avatar': 'assets/images/ali.png',
    },
    {
      'text':
          '“You must build calluses on your mind just like on your hands.\n'
              'Every time you push through doubt and fatigue — you evolve.”',
      'author': 'David Goggins',
      'subtitle': 'Athlete, Speaker',
      'avatar': 'assets/images/david.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final q = _quotes[index % _quotes.length];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xAF0C4180),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Quote text
              Text(
                q['text']!,
                style: const TextStyle(fontSize: 12, color: Colors.white),
                softWrap: true,
              ),

              const SizedBox(height: 14),

              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      q['avatar']!,
                      width: 42,
                      height: 42,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        q['author']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        q['subtitle']!,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
