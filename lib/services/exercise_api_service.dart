import 'package:dio/dio.dart';
import 'package:fitness_app_project/services/models/exercise.dart';
import 'package:logger/web.dart';

class ExerciseApiService {
  final logger = Logger();
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1',
      headers: {
        'X-Api-Key': 'px9mzqTROJ1YQ2Ee6BNdfw==cxhD5jhfKMgeebnn',
      },
      connectTimeout: Duration(seconds: 5), 
      receiveTimeout: Duration(seconds: 5),
    ),
  );

  final Map<String, List<Exercise>> _cache = {};
  bool _isAllDataCached = false;

  Future<Map<String, List<Exercise>>> getAllMuscleExercises() async {
    if (_isAllDataCached) {
      logger.i("✅ Returning all data from cache");
      return Map.from(_cache);
    }

    const muscles = [
      'abdominals', 'biceps', 'chest', 'forearms',
      'glutes', 'lats', 'lower_back', 'middle_back',
      'neck', 'quadriceps', 'triceps'
    ];

    try {
      final futures = muscles.map((muscle) => _fetchSingleMuscle(muscle));
      final results = await Future.wait(futures);

      final Map<String, List<Exercise>> resultMap = {};
      for (var entry in results) {
        resultMap[entry.key] = entry.value;
        _cache[entry.key] = entry.value; 
      }

      _isAllDataCached = true;
      logger.i("✅ All muscle data loaded and cached");
      return resultMap;
    } catch (e) {
      logger.e("Error in getAllMuscleExercises: $e");
      return {};
    }
  }

  Future<MapEntry<String, List<Exercise>>> _fetchSingleMuscle(String muscle) async {
    try {
      if (_cache.containsKey(muscle)) {
        return MapEntry(muscle, _cache[muscle]!);
      }

      final response = await _dio.get(
        '/exercises',
        queryParameters: {'muscle': muscle, 'offset': 0},
      );

      if (response.statusCode == 200) {
        final List list = response.data;
        final exercises = list
            .take(10)
            .map((e) => Exercise.fromJson(e))
            .toList();
        return MapEntry(muscle, exercises);
      }
      return MapEntry(muscle, <Exercise>[]);
    } catch (e) {
      logger.e("Error fetching $muscle: $e");
      return MapEntry(muscle, <Exercise>[]);
    }
  }

  void clearCache() {
    _cache.clear();
    _isAllDataCached = false;
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
}