class CheckInRequest {
  final String score;
  final String checkin_type;
  final String comment;

  CheckInRequest({required this.score, required this.checkin_type, required this.comment});

  Map<String, dynamic> toJson() {
    try {
      return {
        'score': score,
        'checkin_type': checkin_type,
        'comment': comment,
      };
    } catch (e) {
      print('Erro ao converter CheckInRequest para JSON: $e');
      // Você pode retornar um mapa vazio ou lançar uma exceção
      return {};
      // Ou lançar uma exceção:
      // throw Exception('Erro ao converter CheckInRequest para JSON: $e');
    }
  }
}