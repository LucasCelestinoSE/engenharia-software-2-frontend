import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/login/login_provider.dart';
import 'package:testando/features/register/register_page.dart';
import 'package:testando/features/register/register_screen.dart';
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
            const SizedBox(height: 40),
            TextField(
              onChanged: (value) => loginProvider.email = value,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Color(0xFF948B80),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => loginProvider.password = value,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                filled: true,
                fillColor: Color(0xFF948B80),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(15)),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "esqueceu a senha?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 44),
            RoundedButton(
              isLoading: loginProvider.isLoading,
              onPressed: () {
                loginProvider.login(loginProvider.email, loginProvider.password);
                print("Login attempt for ${loginProvider.email}");
              },
              text: 'Entrar',
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // Navega para a rota '/create_account'
                Navigator.pushNamed(context, RegisterPage.routeName);
              },
              child: Text(
                "Criar-conta",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}