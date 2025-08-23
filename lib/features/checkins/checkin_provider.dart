import 'package:flutter/material.dart';
import 'package:testando/data/api/requests/checkins/checkin_request.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/session_manager.dart';

class CheckinProvider with ChangeNotifier {
  final UserRepository _userRepository;
  final SessionManager _sessionManager;
  CheckinProvider(this._userRepository, this._sessionManager);

  bool _isLoading = false;
  String? _errorMessage;
  int _selectedEmoji = 1;
  String _comment = '';
  List<String> _selectedFeelings = [];
  late int userId;
  late String token;
  // Getters
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  int get selectedEmoji => _selectedEmoji;
  String get comment => _comment;
  List<String> get selectedFeelings => _selectedFeelings;

  // Setters
  void setSelectedEmoji(int value) {
    _selectedEmoji = value;
    notifyListeners();
  }

  void setComment(String value) {
    _comment = value;
    notifyListeners();
  }

  void toggleFeeling(String feeling) {
    if (_selectedFeelings.contains(feeling)) {
      _selectedFeelings.remove(feeling);
    } else {
      _selectedFeelings.add(feeling);
    }
    notifyListeners();
  }
  void debug(){
    print("Debugging CheckinProvider");
    print("Selected Emoji: $_selectedEmoji");
    print("Comment: $_comment");
    print("Selected Feelings: $_selectedFeelings");
  }
  Future<bool> submitCheckin() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      userId = (await _sessionManager.getUserId())!;
      token = (await _sessionManager.getToken())!;
      if(userId == null || token == null){
        throw Exception('Usuário não está logado ou dados de sessão inválidos');
      }
      final request = CheckInRequest(
        score: _selectedEmoji.toString(),
        checkin_type: _selectedFeelings.join(','),
        comment: _comment,
      );

      // Aqui você faria a chamada para a API
      await _userRepository.createCheckin(token, userId, request);

      _isLoading = false;
      debug();
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Erro ao registrar check-in: $e';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}