class Exercise {
  final String id;
  final String name;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;
  final String videoUrl; 

  Exercise({
    required this.id,
    required this.name,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
    required this.videoUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    final String id = "${json['name']}_${json['muscle']}_${json['difficulty']}";
    return Exercise(  
      id: id,
      name: json['name'] ?? '',
      muscle: json['muscle'] ?? '',
      equipment: json['equipment'] ?? '',
      difficulty: json['difficulty'] ?? '',
      instructions: json['instructions'] ?? '',
      videoUrl: json['videoUrl'] ?? '',
    );
  }
}
