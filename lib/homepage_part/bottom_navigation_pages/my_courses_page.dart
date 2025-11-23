import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/services/favorite_service.dart';

class MyCoursesPage extends StatefulWidget {
  final User user;
  const MyCoursesPage({super.key, required this.user});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  int getMinutes(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return 15;
      case 'intermediate':
        return 25;
      case 'advanced':
      case 'expert':
        return 40;
      default:
        return 15;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteService().favorites;

    return Scaffold(
      appBar: AppBar(title: const Text("My Favorite Exercises")),
      body: favorites.isEmpty
          ? const Center(child: Text("No favorites yet"))
          : Padding(
              padding: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: favorites.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final ex = favorites[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ExerciseDetailsPage(exercise: ex),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                              color: Colors.black12)
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ex.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.star, size: 14, color: Colors.blueAccent),
                              const SizedBox(width: 6),
                              Text(ex.difficulty),
                              const SizedBox(width: 16),
                              Icon(Icons.timer, size: 14, color: Colors.green),
                              const SizedBox(width: 6),
                              Text("${getMinutes(ex.difficulty)} min"),
                              const Spacer(),
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  setState(() {
                                    FavoriteService().removeFromFavorites(ex);
                                  });
                                },
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.fitness_center, size: 14, color: Colors.orange),
                              const SizedBox(width: 6),
                              Text(ex.equipment),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
