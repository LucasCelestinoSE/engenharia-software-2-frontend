import 'package:flutter/material.dart';
import 'package:testando/data/api/requests/user_entry/user_register.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/register/widgets/sucess_screen.dart';

class RegisterProvider with ChangeNotifier {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  String dateOfBirth = '';

  final UserRepository _userRepository;
  bool _isLoading = false;
  String? _errorMessage;
  BuildContext context;
  RegisterProvider(this._userRepository, this.context);

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

   setDateOfBirth(String value) {
     dateOfBirth = value;
     notifyListeners();
   }
  Future<bool> register() async {
    UserRegisterRequest user = UserRegisterRequest(
      name: name,
      email: email,
      password: password,
      date_of_birth: dateOfBirth
      
    );
    print(name);
    print(email);
    print(password);
    try {
      _isLoading = true;
      _errorMessage = null;
      notifyListeners();

      await _userRepository.registerUser(user);
      Navigator.pushNamedAndRemoveUntil(context, SucessScreen.routeName, (Route<dynamic> route) => false);
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