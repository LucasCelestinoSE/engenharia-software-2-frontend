import 'package:flutter/material.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/data/requests/user_entry/user_login.dart';

class LoginProvider with ChangeNotifier {
  // 1. Remova a inicialização daqui
  final UserRepository _userRepository;

  // 2. Receba o repositório no construtor
  LoginProvider(this._userRepository);

  bool _isLoading = false;
  String? _errorMessage;
  String _email = "lucas123"; // Placeholder para o email
  String _password = "Lucas123"; // Placeholder para a senha
  String get email => _email;
  String get password => _password;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      // A lógica interna continua a mesma
      // final response = await _userRepository.login(UserLoginRequest(email: email, password: password),1);
      _email = "lucas1234";
      _password = "Lucas1234";
      _isLoading = false;
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