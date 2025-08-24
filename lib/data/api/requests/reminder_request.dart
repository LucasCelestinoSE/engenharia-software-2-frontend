class ReminderRequest {
  final String message;
  final String dueAt;

  ReminderRequest({
    required this.message,
    required this.dueAt,
  });

  factory ReminderRequest.fromJson(Map<String, dynamic> json) {
    try {
      return ReminderRequest(
        message: json['message'] as String,
        dueAt: json['due_at'] as String,
      );
    } catch (e) {
      print('Erro ao converter ReminderRequest: $e');
      // Retorna um objeto padrão em caso de erro
      return ReminderRequest(
        message: 'Erro na conversão',
        dueAt: DateTime.now().toIso8601String(),
      );
      // Ou lance uma exceção:
      // throw Exception('Erro ao converter ReminderRequest: $e');
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'message': message,
        'due_at': dueAt,
      };
    } catch (e) {
      print('Erro ao converter ReminderRequest para JSON: $e');
      return {};
      // Ou lance uma exceção:
      // throw Exception('Erro ao converter ReminderRequest para JSON: $e');
    }
  }
}