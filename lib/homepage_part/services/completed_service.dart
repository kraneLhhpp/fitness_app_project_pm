import 'package:fitness_app_project/homepage_part/services/models/completed_exercise_entry.dart';
import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';

class CompletedService {
  static final CompletedService _instance = CompletedService._internal();
  factory CompletedService() => _instance;
  CompletedService._internal();

  final List<CompletedExerciseEntry> _completedExercises = [];


  List<CompletedExerciseEntry> get completed => _completedExercises;

  bool isCompleted(Exercise exercise) {
    return _completedExercises.any((e) => e.exercise.name == exercise.name);
  }

  void markCompleted(Exercise exercise) {
    if (!isCompleted(exercise)) {
      _completedExercises.add(
        CompletedExerciseEntry(exercise: exercise, completedDate: DateTime.now())
      );
    }
  }

  List<CompletedExerciseEntry> getByDay(DateTime day) {
    return _completedExercises.where((entry) =>
        entry.completedDate.year == day.year &&
        entry.completedDate.month == day.month &&
        entry.completedDate.day == day.day
    ).toList();
  }

  List<CompletedExerciseEntry> getByRange(DateTime start, DateTime end) {
    return _completedExercises.where((entry) =>
        entry.completedDate.isAfter(start.subtract(const Duration(days: 1))) &&
        entry.completedDate.isBefore(end.add(const Duration(days: 1)))
    ).toList();
  }
}
