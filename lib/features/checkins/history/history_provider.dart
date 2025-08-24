import 'package:flutter/material.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/checkins/models/emotion_entry.dart';
import 'package:testando/session_manager.dart';

class HistoryProvider extends ChangeNotifier {
  List<EmotionEntry> entries = [];
  bool isLoading = false;
  bool hasError = false;
  UserRepository _userRepository;
  SessionManager _sessionManager;

  HistoryProvider(this._userRepository, this._sessionManager);

  Future<void> loadHistory() async {
    isLoading = true;
    hasError = false;
    notifyListeners();

    try {
      // Sua lógica para carregar dados
      //entries = await yourApiCall();
      hasError = false;
    } catch (e) {
      hasError = true;
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  void printOlamundo() {
    print("Ola mundo from HistoryProvider");
  }
}