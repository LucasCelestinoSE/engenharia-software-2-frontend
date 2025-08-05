import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/login/login_provider.dart';
import 'package:testando/widgets/rounded_button.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  final String title = 'iMood'; // Título da página
  static String routeName = '/login';
  @override
  Widget build(BuildContext context) {
    // Obtém o LoginProvider do contexto para acessar os dados de login
    // Isso permite que a tela de login reaja a mudanças no estado do LoginProvider.
    final loginProvider = context.watch<LoginProvider>();
    return Scaffold(
      backgroundColor: const Color(0xFFDFD9CB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFDFD9CB),
        
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // Alinha os itens no topo da tela em vez do centro.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Text(
                "Login",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loginProvider.email,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: loginProvider.password,
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            Text("esqueci a senha",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20),
            RoundedButton(
              onPressed: () =>
                loginProvider.login(loginProvider.email, loginProvider.password),
              text: 'Entrar',
            ),
            const SizedBox(height: 20),
            Text("Criar-conta",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}