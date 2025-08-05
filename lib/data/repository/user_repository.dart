import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/requests/user_entry/user_login.dart';
import 'package:testando/data/responses/user_login_response.dart';

abstract class IUserRepository {
  // Aqui está a interface do repositório de usuário.
  // Ela define os métodos que o repositório deve implementar.
  Future<UserLoginResponse> login(UserLoginRequest request, int verbose);
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
  Future<UserLoginResponse> login(UserLoginRequest request, int verbose) {
    String email = request.email;
    String password = request.password;
    String token = "ASFHUASHUFHahhsduasdhuasuhduahsdhuiasuidhasuidhasuidh";
    if(email == "lucas.cel001@gmail.com" && password == "Lucas123") {
      if (verbose == 1) {
        print("Logging in user: ${request.email}, token: $token");
      }
    }
    return api.login(request);
  }
}