import 'package:dio/dio.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:logger/web.dart';

class ExerciseApiService {
  final logger = Logger();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1',
      headers: {
        'X-Api-Key': 'lOh0p1eFn8Kzns9tSq/Tkg==qiPf4GjzfaUrShTb', 
      },
    ),
  );

  final Map<String, List<Exercise>> _cache = {};

  int getFixedMinutes(String difficulty) {
    switch (difficulty.toLowerCase()) {
      case 'beginner':
        return 15;
      case 'intermediate':
        return 25;
      case 'expert':
      case 'advanced':
        return 40;
      default:
        return 15;
    }
  }

  Future<List<Exercise>> fetchExercisesByMuscle(String muscle,
      {int limit = 10}) async {
    try {
      if (_cache.containsKey(muscle)) {
        return _cache[muscle]!;
      }

      final res = await _dio.get(
        '/exercises',
        queryParameters: {
          'muscle': muscle,
          'limit': limit,
        },
      );

      final List raw = res.data;

      final exercises =
          raw.map((e) => Exercise.fromJson(e)).toList();

      _cache[muscle] = exercises;

      return exercises;
    } catch (e) {
      logger.e("API error: $e");
      return [];
    }
  }

  Future<Map<String, List<Exercise>>> getAllMuscleExercises() async {
    Map<String, List<Exercise>> result = {};

    const muscles = [
      'abdominals',
      'biceps',
      'chest',
      'forearms',
      'glutes',
      'lats',
      'lower_back',
      'middle_back',
      'neck',
      'quadriceps',
      'triceps'
    ];

    try {
      for (final muscle in muscles) {
        final response = await _dio.get('/exercises', queryParameters: {
          'muscle': muscle,
        });

        final List list = response.data;

        result[muscle] = list.map((e) => Exercise.fromJson(e)).toList();
      }

      return result;
    } catch (e) {
      logger.e("API error: $e");
      return {};
    }
  }
  Future<List<Exercise>> getExercises({required String muscle}) async {
  try {
    final response = await _dio.get('/exercises', queryParameters: {
      'muscle': muscle,
    });

    final List list = response.data;
    return list.map((e) => Exercise.fromJson(e)).toList();
  } catch (e) {
    Logger().e("API error: $e");
    return [];
  }
}

}
