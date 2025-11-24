import 'package:fitness_app_project/homepage_part/exercises/exercise_video_page.dart';
import 'package:fitness_app_project/services/completed_service.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:fitness_app_project/services/favorite_service.dart';
import 'package:url_launcher/url_launcher.dart';


class ExerciseDetailsPage extends StatefulWidget {
  final Exercise exercise;
  const ExerciseDetailsPage({super.key, required this.exercise});

  @override
  State<ExerciseDetailsPage> createState() => _ExerciseDetailsPageState();
}

class _ExerciseDetailsPageState extends State<ExerciseDetailsPage> {

  void openVideo() async {
  final url = Uri.parse(widget.exercise.videoUrl);

  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    if(!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Cannot open video")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    final isFav = FavoriteService().isFavorite(widget.exercise);

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.exercise.muscle.toUpperCase(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [

            Text(
              widget.exercise.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 18),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                border: Border.all(
                  width: 1.5,
                  color: Colors.pinkAccent.withValues(alpha: 0.4),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.pinkAccent.withValues(alpha: 0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Muscle type: ${widget.exercise.muscle}"),
                  const SizedBox(height: 6),
                  Text("Equipment: ${widget.exercise.equipment}"),
                  const SizedBox(height: 6),
                  Text("Difficulty: ${widget.exercise.difficulty}"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              "Instructions",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),
            Text(
              widget.exercise.instructions,
              style: const TextStyle(fontSize: 15),
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: Icon(
                isFav ? Icons.check : Icons.favorite,
                color: Colors.white,
              ),
              label: Text(
                isFav ? "Added to My Courses" : "Add to My Courses",
                style: const TextStyle(color: Colors.white),
              ),
              onPressed: () {
                FavoriteService().addToFavorites(widget.exercise);
                setState(() {});
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        Text("${widget.exercise.name} added to My Courses"),
                  ),
                );
              },
            ),
            const SizedBox(height: 14),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.play_arrow, color: Colors.white),
              label: const Text(
                "Watch Video",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (widget.exercise.videoUrl.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("No video available for this exercise")),
                  );
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ExerciseVideoPage(videoUrl: widget.exercise.videoUrl),
                  ),
                );
              },
            ),  
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              icon: const Icon(Icons.check_circle, color: Colors.white),
              label: const Text(
                "Выполнено",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                CompletedService().markCompleted(widget.exercise);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${widget.exercise.name} отмечено как выполнено")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
