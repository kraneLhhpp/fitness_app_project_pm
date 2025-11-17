import 'package:flutter/material.dart';
import 'package:fitness_app_project/widgets/quotes_swipes.dart';
import 'package:fitness_app_project/widgets/view_quote.dart';
import 'package:fitness_app_project/widgets/dot_image.dart';

class QuoteHeader extends StatelessWidget {
  final QuotesSwipes quotesSwipes;
  final Function(int) onDotTap;
  final VoidCallback onSwipeRight;
  final VoidCallback onSwipeLeft;

  const QuoteHeader({
    super.key,
    required this.quotesSwipes,
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
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) {
                  return SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: ViewQuote(
                  key: ValueKey(quotesSwipes.currentIndex),
                  index: quotesSwipes.currentIndex,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                quotesSwipes.totalQuotes,
                (i) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: GestureDetector(
                    onTap: () => onDotTap(i),
                    child: DotImage(
                      isFocused: quotesSwipes.currentIndex == i,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
