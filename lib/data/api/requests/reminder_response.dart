class ReminderResponse {
  final int id;
  final String message;
  final String dueAt;
  final bool done;
  final String createdAt;

  ReminderResponse({
    required this.id,
    required this.message,
    required this.dueAt,
    required this.done,
    required this.createdAt,
  });

  factory ReminderResponse.fromJson(Map<String, dynamic> json) {
    try {
      return ReminderResponse(
        id: json['id'] as int,
        message: json['message'] as String,
        dueAt: json['due_at'] as String,
        done: json['done'] as bool,
        createdAt: json['created_at'] as String,
      );
    } catch (e) {
      print('Erro ao converter ReminderResponse: $e');
      // Retorna um objeto padrão em caso de erro
      return ReminderResponse(
        id: 0,
        message: 'Erro na conversão',
        dueAt: DateTime.now().toIso8601String(),
        done: false,
        createdAt: DateTime.now().toIso8601String(),
      );
      // Ou lance uma exceção:
      // throw Exception('Erro ao converter ReminderResponse: $e');
    }
  }

  Map<String, dynamic> toJson() {
    try {
      return {
        'id': id,
        'message': message,
        'due_at': dueAt,
        'done': done,
        'created_at': createdAt,
      };
    } catch (e) {
      print('Erro ao converter ReminderResponse para JSON: $e');
      return {};
      // Ou lance uma exceção:
      // throw Exception('Erro ao converter ReminderResponse para JSON: $e');
    }
  }
}