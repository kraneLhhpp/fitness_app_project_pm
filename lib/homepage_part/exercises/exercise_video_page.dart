import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExerciseVideoPage extends StatefulWidget {
  final String videoUrl;

  const ExerciseVideoPage({super.key, required this.videoUrl});

  @override
  State<ExerciseVideoPage> createState() => _ExerciseVideoPageState();
}

class _ExerciseVideoPageState extends State<ExerciseVideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final videoId = YoutubePlayer.convertUrlToId(widget.videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(title: const Text("Exercise Video")),
          body: Column(
            children: [
              player,
            ],
          ),
        );
      },
    );
  }
}