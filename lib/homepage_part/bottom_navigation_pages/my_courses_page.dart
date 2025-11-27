import 'package:fitness_app_project/homepage_part/exercises/exercise_details_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app_project/homepage_part/services/favorite_service.dart';
import 'package:google_fonts/google_fonts.dart';

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
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Text(
          "My Courses",
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),

      body: favorites.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bookmark_border,
                    size: 120,
                    color: Colors.grey.shade400,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "No saved workouts yet",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Add exercises from the catalog",
                    style: GoogleFonts.jetBrainsMono(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
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
                    margin: const EdgeInsets.only(bottom: 18),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(color: Colors.pinkAccent, width: 2),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                          color: Colors.black12,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(
                            Icons.fitness_center,
                            size: 36,
                            color: Colors.blue,
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ex.name,
                                style: GoogleFonts.jetBrainsMono(
                                  textStyle: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ex.difficulty,
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                  const SizedBox(width: 14),
                                  Icon(
                                    Icons.timer,
                                    size: 14,
                                    color: Colors.blueAccent,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    "${getMinutes(ex.difficulty)} min",
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(height: 6),

                              Row(
                                children: [
                                  Icon(
                                    Icons.sports_gymnastics,
                                    size: 14,
                                    color: Colors.green,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    ex.equipment,
                                    style: GoogleFonts.jetBrainsMono(
                                      textStyle: TextStyle(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.pinkAccent,
                          ),
                          onPressed: () {
                            setState(() {
                              FavoriteService().removeFromFavorites(ex);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
