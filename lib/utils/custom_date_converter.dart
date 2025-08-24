import 'package:intl/intl.dart';

String formatCreatedAt(String createdAt) {
  try {
    // Parse da string ISO 8601 para DateTime
    DateTime dateTime = DateTime.parse(createdAt);
    
    // Converte para horário local (se necessário)
    DateTime localDateTime = dateTime.toLocal();
    
    // Formata para uma data legível
    return DateFormat('dd/MM/yyyy').format(localDateTime);
  } catch (e) {
    print('Erro ao formatar data: $e');
    return 'Data inválida';
  }
}