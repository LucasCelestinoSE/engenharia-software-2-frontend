import 'package:testando/data/models/user.dart';

class ApiService {
  Future<void> registerUser(User user) async {
    // Simulando uma chamada de API com um delay
    await Future.delayed(const Duration(seconds: 2));

    // Aqui você faria a chamada HTTP real, ex:
    // final response = await http.post(
    //   Uri.parse('https://sua-api.com/registro'),
    //   body: {
    //     'name': user.name,
    //     'email': user.email,
    //     // ... etc
    //   },
    // );
    //
    // if (response.statusCode != 201) {
    //   throw Exception('Erro ao registrar usuário');
    // }

    print('Usuário ${user.email} registrado com sucesso na API.');
  }
}