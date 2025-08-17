import 'package:flutter/material.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/data/api/requests/user_entry/user_login.dart';
import 'package:testando/session_manager.dart';

class LoginProvider with ChangeNotifier {
  // 1. Remova a inicialização daqui
  final UserRepository _userRepository;

  // 2. Receba o repositório no construtor
  LoginProvider(this._userRepository, this._sessionManager);

  final SessionManager _sessionManager;

  bool _isLoading = false;
  String? _errorMessage;
  late String _email = ''; // Placeholder para o email
  late String _password = ''; // Placeholder para a senha
  String get email => _email;
  String get password => _password;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  set email(String value) {
    _email = value;
    print("Email set to: $_email");
    notifyListeners();
  }

  set password(String value) {
    _password = value;
    print("Password set to: $_password");
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {

    _isLoading = false;
    _errorMessage = null;
    notifyListeners();

    try {
      _isLoading = true;
      final response = await _userRepository.login(UserLoginRequest(email: email, password: password));
      _sessionManager.setToken(response.token);
      print(response.token);
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Falha no login. Verifique suas credenciais.';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}