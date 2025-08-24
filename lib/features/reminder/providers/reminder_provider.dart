import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testando/data/api/requests/reminder_request.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/reminder/models/reminder_model.dart';
import 'package:testando/session_manager.dart';

class ReminderProvider with ChangeNotifier {
  // Lista de lembretes para simulação
  final List<Reminder> _reminders = [];
    bool _initialized = false;

  // Método para inicializar o provider
  Future<void> init() async {
    if (!_initialized) {
      getReminderList();
      _initialized = true;
    }
  }
  // Criar um conversor do formato ISO para formato legível
  List<Reminder> get reminders => _reminders;
  final UserRepository _userRepository;
  final SessionManager _sessionManager;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  ReminderProvider({required UserRepository userRepository, required SessionManager sessionManager})
      : _userRepository = userRepository,
        _sessionManager = sessionManager;

  Future<void> addReminder(Reminder newReminder) async {
    final now = DateTime.now();
    final ReminderRequest reminderRequest = ReminderRequest(
      message: newReminder.name,
      dueAt: "${DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(newReminder.time.split(":")[0]),
        int.parse(newReminder.time.split(":")[1]),
      ).toIso8601String()}Z",
    );
    String token = await _sessionManager.getToken() ?? "";
    int id = await _sessionManager.getUserId() ?? 0;
    _userRepository.createReminder(token,id, reminderRequest);
    notifyListeners();
  }
  
  void getReminderList() async {
    _isLoading = true;
    notifyListeners();
    String token = await _sessionManager.getToken() ?? "";
    int id = await _sessionManager.getUserId() ?? 0;
    final response = await _userRepository.getReminder(token, id);
    _reminders.clear();
    for (var reminder in response) {
      _reminders.add(Reminder(name: reminder.message, time: reminder.dueAt.split("T")[1].substring(0,5), days: ['seg']));
    }
    _isLoading = false;
    notifyListeners();
  }
  void removeReminderAt(int index) {
    final removed = _reminders[index];
    _reminders.removeAt(index);
    print("Lembrete excluído: '${removed.name}'");
    notifyListeners();
  }
}