import 'package:fitness_app_project/services/models/exercise.dart';

class FavoriteService {
  static final FavoriteService _instance = FavoriteService._internal();
  factory FavoriteService() => _instance;

  FavoriteService._internal();

  final List<Exercise> _favorites = [];

  List<Exercise> get favorites => _favorites;

  void addToFavorites(Exercise exercise) {
    if (!_favorites.any((e) => e.id == exercise.id)) {
      _favorites.add(exercise);
    }
  }

  void removeFromFavorites(Exercise exercise) {
    _favorites.removeWhere((e) => e.id == exercise.id);
  }

  bool isFavorite(Exercise exercise) {
    return _favorites.any((e) => e.id == exercise.id);
  }
}
