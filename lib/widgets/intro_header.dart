import 'package:flutter/material.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';

class IntroHeader extends StatelessWidget {
  final int currentIndex;
  final List<String> titles;
  final List<String> subtitles;

  final Function(int) onDotTap;
  final VoidCallback onSwipeLeft;
  final VoidCallback onSwipeRight;

  const IntroHeader({
    super.key,
    required this.currentIndex,
    required this.titles,
    required this.subtitles,
    required this.onDotTap,
    required this.onSwipeLeft,
    required this.onSwipeRight,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.primaryVelocity! < 0) {
          onSwipeLeft();
        } else {
          onSwipeRight();
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Column(
              key: ValueKey(currentIndex),
              children: [
                Text(
                  titles[currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  subtitles[currentIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              titles.length,
              (i) => GestureDetector(
                onTap: () => onDotTap(i),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: DotImage(isFocused: currentIndex == i),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
