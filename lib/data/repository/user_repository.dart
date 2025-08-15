import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/requests/user_entry/user_login.dart';
import 'package:testando/data/requests/user_entry/user_register.dart';
import 'package:testando/data/responses/user_login_response.dart';
import 'package:testando/data/responses/user_register_response.dart';

abstract class IUserRepository {
  // Aqui está a interface do repositório de usuário.
  // Ela define os métodos que o repositório deve implementar.
  Future<UserLoginResponse> login(UserLoginRequest request);
  Future<UserRegisterResponse> createUser(UserRegisterRequest registerRequest);
  // Você pode adicionar outros métodos relacionados ao usuário aqui, como registro, logout, etc.

}
// Repositório de usuário que implementa a interface IUserRepository
// Ele pode usar o ApiClient para fazer chamadas de API relacionadas ao usuário.
class UserRepository implements IUserRepository {
  // Aqui você pode implementar a lógica de autenticação, como chamar o ApiClient.
  // Por exemplo, você pode injetar o ApiClient no construtor e usá-lo para fazer login.
  final ApiClient api;
  UserRepository({required this.api});

  @override
  Future<UserRegisterResponse> createUser(UserRegisterRequest registerRequest) {
    try {
      return api.createUser(registerRequest);
    } catch (e) {
      print("Error creating user: ${registerRequest.email}");
      rethrow;
    }
  }

  @override
  Future<UserLoginResponse> login(UserLoginRequest request) {
    try {
      return api.login(request);
    } catch (e) {
      print("Error logging in user: ${request.email}");
      rethrow;
    }
  }
}