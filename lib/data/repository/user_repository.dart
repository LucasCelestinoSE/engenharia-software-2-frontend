import 'package:dio/dio.dart';
import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/api/requests/checkins/checkin_request.dart';
import 'package:testando/data/api/requests/checkins/checkin_response.dart';
import 'package:testando/data/api/requests/user_entry/user_login.dart';
import 'package:testando/data/api/requests/user_entry/user_register.dart';
import 'package:testando/data/api/responses/user_login_response.dart';
import 'package:testando/data/api/responses/user_register_response.dart';
import 'package:testando/data/models/user.dart';

abstract class IUserRepository {
  // Aqui está a interface do repositório de usuário.
  // Ela define os métodos que o repositório deve implementar.
  Future<UserLoginResponse> login(UserLoginRequest request);
  Future<UserRegisterResponse> registerUser(UserRegisterRequest registerRequest);
  Future<void> me(String authorization);
  Future<CheckinResponse> createCheckin(String authorization, int sessionUserid, CheckInRequest request);
  // Você pode adicionar outros métodos relacionados ao usuário aqui, como registro, logout, etc.

}
// Repositório de usuário que implementa a interface IUserRepository
// Ele pode usar o ApiClient para fazer chamadas de API relacionadas ao usuário.
class UserRepository implements IUserRepository {
  // Aqui você pode implementar a lógica de autenticação, como chamar o ApiClient.
  // Por exemplo, você pode injetar o ApiClient no construtor e usá-lo para fazer login.
  final ApiClient _api;
  UserRepository({required ApiClient api}) : _api = api;

  @override
Future<UserRegisterResponse> registerUser(UserRegisterRequest registerRequest) async {
  try {
    print("Enviando requisição: ${registerRequest.toJson()}");
    final response = await _api.registerUser(registerRequest);
    print("Resposta recebida: $response");
    return response;
  } catch (e) {
    print("Erro ao registrar: ${e.toString()}");
    if (e is DioException) {
      print("Status code: ${e.response?.statusCode}");
      print("Resposta: ${e.response?.data}");
    }
    rethrow;
  }
}
  @override
  Future<UserLoginResponse> login(UserLoginRequest request) {
    try {
      return _api.login(request);
    } catch (e) {
      print("login: Erro:" + e.toString());
      rethrow;
    }
  }
  @override
  Future<User> me(String authorization) {
    try {
      return _api.me(authorization: authorization);
    } catch (e) {
      print("me: Erro:" + e.toString());
      rethrow;
    }
  }
  @override
  Future<CheckinResponse> createCheckin(String authorization, int sessionUserid, CheckInRequest request) async {
  try {
    return await _api.createCheckIn(authorization, sessionUserid, request);
  } catch (e) {
    print("createCheckin: Erro:" + e.toString());
    rethrow;
  }
  }
}