import 'package:fitness_app_project/homepage_part/services/completed_service.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';
import 'package:fitness_app_project/homepage_part/services/favorite_service.dart';
import 'package:google_fonts/google_fonts.dart';
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
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Cannot open video")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFav = FavoriteService().isFavorite(widget.exercise);
    final isCompleted = CompletedService().isCompleted(widget.exercise);
    final exName = widget.exercise.name;

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.exercise.muscle.toUpperCase(),
          style: GoogleFonts.jetBrainsMono(
            textStyle: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text(
              exName,
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
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
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Muscle type: ",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                          color: Colors.pinkAccent,
                        ),
                      ),
                      Text(
                        "${widget.exercise.muscle}",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "Equipment: ",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                          color: Colors.pinkAccent,
                        ),
                      ),
                      Text(
                        "${widget.exercise.equipment}",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "Difficulty: ",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                          color: Colors.pinkAccent,
                        ),
                      ),
                      Text(
                        "${widget.exercise.difficulty}",
                        style: GoogleFonts.jetBrainsMono(
                          textStyle: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              "Instructions",
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(fontSize: 20),
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              widget.exercise.instructions,
              style: GoogleFonts.jetBrainsMono(
                textStyle: TextStyle(fontSize: 14),
                letterSpacing: -1,
              ),
            ),

            const SizedBox(height: 24),

            buttonType(
              icon: isFav ? Icons.check : Icons.favorite,
              text: isFav ? 'Added to Favorites' : 'Add to Favorites',
              onPressed: () {
                FavoriteService().addToFavorites(widget.exercise);
                setState(() {});
                customSnackBar(context, exName, 'added to Favorites');
              },
            ),
            const SizedBox(height: 14),
            buttonType(
              icon: Icons.play_arrow,
              text: 'Watch Video',
              onPressed: () async {
                String urlToLaunch = widget.exercise.videoUrl;

                if (urlToLaunch.isEmpty) {
                  final query = Uri.encodeComponent(
                    "${widget.exercise.name} exercise tutorial",
                  );
                  urlToLaunch =
                      "https://www.youtube.com/results?search_query=$query";
                }

                final uri = Uri.parse(urlToLaunch);

                try {
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri, mode: LaunchMode.externalApplication);
                  } else {
                    await launchUrl(uri, mode: LaunchMode.platformDefault);
                  }
                } catch (e) {
                  if (!context.mounted) return;
                  customSnackBar(context, exName, ': could not launch video');
                }
              },
            ),
            const SizedBox(height: 14),
            buttonType(
              icon: isCompleted ? Icons.check : Icons.check_circle,
              text: isCompleted ? 'Completed' : 'Complete',
              onPressed: () {
                CompletedService().markCompleted(widget.exercise);
                setState(() {});
                customSnackBar(context, exName, 'mark as completed');
              },
            ),
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    BuildContext context,
    String exName,
    String markText,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 1400),
        content: Text("$exName $markText"),
      ),
    );
  }

  ElevatedButton buttonType({
    required IconData icon,
    required String text,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pinkAccent,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: GoogleFonts.jetBrainsMono(
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      onPressed: onPressed,
    );
  }
}
