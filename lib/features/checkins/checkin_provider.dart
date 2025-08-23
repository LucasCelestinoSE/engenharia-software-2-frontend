import 'package:flutter/material.dart';
import 'package:testando/data/api/requests/checkins/checkin_request.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/session_manager.dart';

class CheckinProvider extends ChangeNotifier {
  final UserRepository _userRepository;
  final SessionManager _sessionManager;
  late int userId;
  CheckinProvider(this._userRepository, this._sessionManager);

  Future<void> createCheckin(CheckInRequest request) async {
    try {
      await _sessionManager.getUserId().then((userId) async {
        if (userId == null) {
          throw Exception("User ID not found in session");
        }
        this.userId = userId; // Set the userId in the request
      });
      await _userRepository.createCheckin(userId, request);
      notifyListeners();
    } catch (e) {
      print('Erro ao criar check-in: $e');
    }
  }
}