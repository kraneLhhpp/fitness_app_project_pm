import 'package:fitness_app_project/homepage_part/services/models/exercise.dart';

class CompletedExerciseEntry {
  final Exercise exercise;
  final DateTime completedDate;

  CompletedExerciseEntry({
    required this.exercise,
    required this.completedDate,
  });
}