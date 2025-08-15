import 'package:flutter/material.dart';
import 'package:testando/data/models/user.dart';
import 'package:testando/data/repository/registro_repository.dart';

enum RegistrationStatus { initial, loading, success, error }

class RegistrationProvider with ChangeNotifier {
  final UserRepository _userRepository;

  RegistrationProvider(this._userRepository);

  RegistrationStatus _status = RegistrationStatus.initial;
  String? _errorMessage;

  RegistrationStatus get status => _status;
  String? get errorMessage => _errorMessage;

  Future<void> registerUser({
    required String name,
    required String email,
    required String birthDate,
    required String password,
  }) async {
    _status = RegistrationStatus.loading;
    _errorMessage = null;
    notifyListeners();

    try {
      final newUser = User(
        name: name,
        email: email,
        birthDate: birthDate,
        password: password,
      );
      await _userRepository.registerUser(newUser);
      _status = RegistrationStatus.success;
    } catch (e) {
      _status = RegistrationStatus.error;
      _errorMessage = e.toString();
    } finally {
      notifyListeners();
    }
  }
}