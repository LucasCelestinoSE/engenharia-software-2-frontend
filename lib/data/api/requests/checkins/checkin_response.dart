class CheckinResponse {
  final int id;
  final int score;
  final String checkinType;
  final String comment;
  final String createdAt;

  CheckinResponse({
    required this.id,
    required this.score,
    required this.checkinType,
    required this.comment,
    required this.createdAt,
  });

  factory CheckinResponse.fromJson(Map<String, dynamic> json) {
    try {
      return CheckinResponse(
        id: json['id'] as int,
        score: json['score'] as int,
        checkinType: json['checkin_type'] as String,
        comment: json['comment'] as String,
        createdAt: json['created_at'] as String,
      );
    } catch (e) {
      print('Erro ao converter CheckinResponse: $e');
      // Você pode retornar um objeto padrão ou lançar uma exceção
      return CheckinResponse(
        id: 0,
        score: 0,
        checkinType: 'Erro',
        comment: 'Erro na conversão',
        createdAt: DateTime.now().toString(),
      );
      // Ou lançar uma exceção:
      // throw Exception('Erro ao converter CheckinResponse: $e');
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'score': score,
      'checkin_type': checkinType,
      'comment': comment,
      'created_at': createdAt,
    };
  }
}