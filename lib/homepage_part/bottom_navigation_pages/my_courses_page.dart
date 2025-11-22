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
  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteService().favorites;

    return Scaffold(
      appBar: AppBar(title: Text("My Favorite Exercises")),

      body: favorites.isEmpty
          ? Center(child: Text("No favorites yet"))
          : ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, i) {
                final ex = favorites[i];

                return ListTile(
                  title: Text(ex.name),
                  subtitle: Text("Muscle: ${ex.muscle}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        FavoriteService().removeFromFavorites(ex);
                      });
                    },
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ExerciseDetailsPage(exercise: ex),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
