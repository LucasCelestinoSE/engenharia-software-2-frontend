import 'package:testando/data/api/api_service.dart';
import 'package:testando/data/models/user.dart';

class UserRepository {
  final ApiService _apiService;

  UserRepository(this._apiService);

  Future<void> registerUser(User user) async {
    try {
      await _apiService.registerUser(user);
    } catch (e) {
      throw Exception('Falha no repositório ao registrar o usuário');
    }
  }
}