import 'package:flutter/material.dart';

class MuscleDetailsPage extends StatelessWidget {
  final String muscle;
  final String imagePath;
  final int minutes;
  final String level;
  final int exercisesCount;

  const MuscleDetailsPage({
    super.key,
    required this.muscle,
    required this.imagePath,
    required this.minutes,
    required this.level,
    required this.exercisesCount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
        title: Text(
          muscle.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          const SizedBox(height: 10),

          Text(
            "Start Your $muscle Workout",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: const [
              Icon(Icons.calendar_month, size: 20, color: Colors.grey),
              SizedBox(width: 6),
              Text("Today, 5 March 2023",
                  style: TextStyle(color: Colors.grey)),
            ],
          ),

          const SizedBox(height: 20),

          // MAIN HERO CARD
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [

                // gradient overlay
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withValues(alpha: 0.6),
                        Colors.transparent,
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Spacer(),

                      Text(
                        "Next course:\nRefine your back",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 15),

                      Row(
                        children: [
                          _infoTag(Icons.timer, "$minutes minutes"),
                          const SizedBox(width: 10),
                          _infoTag(Icons.star, "$level level"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Programs",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("See all"),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // PROGRAM CARDS
          Row(
            children: [
              _programCard(
                title: "Upper Back Activation",
                level: "beginner",
                minutes: 30,
              ),
              const SizedBox(width: 16),
              _programCard(
                title: "Full Back Strength",
                level: "advanced",
                minutes: 45,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _infoTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white.withValues(alpha: 0.9),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 18),
          const SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }

  Widget _programCard({
    required String title,
    required String level,
    required int minutes,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 5),
              color: Colors.black.withValues(alpha: 0.1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.brightness_1, size: 12, color: Colors.blue),
                const SizedBox(width: 6),
                Text(level),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                Icon(Icons.brightness_1, size: 12, color: Colors.green),
                const SizedBox(width: 6),
                Text("$minutes min"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
