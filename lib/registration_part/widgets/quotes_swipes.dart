class QuotesSwipes {
  int currentIndex = 0;
  final int totalQuotes;
  QuotesSwipes({required this.totalQuotes});

  int swipeLeft() {
    currentIndex = (currentIndex + 1) % totalQuotes;
    return currentIndex;
  }
  int swipeRight() {
    currentIndex = (currentIndex - 1 + totalQuotes) % totalQuotes;
    return currentIndex;
  }
}
