import 'package:flutter/material.dart';
import 'package:testando/features/reminder/models/reminder_model.dart';

class ReminderProvider with ChangeNotifier {
  // Lista de lembretes para simulação
  final List<Reminder> _reminders = [
    Reminder(name: "Lembrete 1", time: "15:00", days: ["seg", "qua", "sex"]),
    Reminder(name: "Lembrete 2", time: "18:15", days: ["ter", "qui"]),
    Reminder(name: "Lembrete 3", time: "21:40", days: ["seg", "qui"]),
  ];

  List<Reminder> get reminders => _reminders;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void addReminder(Reminder newReminder) {
    _reminders.add(newReminder);
    
    print("Novo lembrete adicionado: '${newReminder.name}'");

    // notifyListeners() avisa a tela para se redesenhar com o novo item.
    notifyListeners();
  }

  void removeReminderAt(int index) {
    final removed = _reminders[index];
    _reminders.removeAt(index);
    print("Lembrete excluído: '${removed.name}'");
    notifyListeners();
  }
}