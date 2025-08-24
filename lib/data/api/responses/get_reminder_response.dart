
class GetReminderResponse {
  final int id;
  final String message;
  final String dueAt;
  final bool done;
  final String createdAt;

  GetReminderResponse({
    required this.id,
    required this.message,
    required this.dueAt,
    required this.done,
    required this.createdAt,
  });

  factory GetReminderResponse.fromJson(Map<String, dynamic> json) {
    try {
      return GetReminderResponse(
        id: json['id'] as int,
        message: json['message'] as String,
        dueAt: json['due_at'] as String,
        done: json['done'] as bool,
        createdAt: json['created_at'] as String,
      );
    } catch (e) {
      print('Erro ao converter GetReminderResponse: $e');
      return GetReminderResponse(
        id: 0,
        message: 'Erro na conversão',
        dueAt: DateTime.now().toIso8601String(),
        done: false,
        createdAt: DateTime.now().toIso8601String(),
      );
    }
  }
}

