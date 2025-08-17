import 'package:flutter/material.dart';
import 'package:testando/data/api/requests/user_entry/user_register.dart';
import 'package:testando/data/repository/user_repository.dart';

class RegisterProvider with ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String date_of_birth = '';

  final UserRepository _userRepository;
  bool _isLoading = false;
  String? _errorMessage;
  
  RegisterProvider(this._userRepository);

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

   setDateOfBirth(String value) {
     date_of_birth = value;
     notifyListeners();
   }
  Future<bool> register() async {
    UserRegisterRequest user = UserRegisterRequest(
      name: name,
      email: email,
      password: password,
      date_of_birth: date_of_birth,
    );
    print(name);
    print(email);
    print(password);
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _userRepository.registerUser(user);

      _isLoading = false;
      notifyListeners();
      return true;
    } catch (e) {
      _errorMessage = 'Erro ao registrar usuário';
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}