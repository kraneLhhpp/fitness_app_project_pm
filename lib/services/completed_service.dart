import 'package:fitness_app_project/services/models/exercise.dart';

class CompletedService {
  static final CompletedService _instance = CompletedService._internal();
  factory CompletedService() => _instance;
  CompletedService._internal();

  final List<Exercise> _completedExercises = [];

  List<Exercise> get completed => _completedExercises;

  bool isCompleted(Exercise exercise) {
    return _completedExercises.any((e) => e.name == exercise.name);
  }

  void markCompleted(Exercise exercise) {
    if (!isCompleted(exercise)) {
      _completedExercises.add(exercise);
    }
  }
}
