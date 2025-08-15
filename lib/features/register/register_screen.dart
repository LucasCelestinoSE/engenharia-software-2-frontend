import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/features/login/login_provider.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/widgets/rounded_button.dart';
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  final String title = 'iMood'; // Título da página
  static String routeName = '/register';
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
                "Registro",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: "Nome",
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
                decoration: InputDecoration(
                  labelText: "Data Nascimento",
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
               const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: "Confirmação de Senha",
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
            const SizedBox(height: 44),
            RoundedButton(
              onPressed: () =>
              Navigator.pushReplacementNamed(context, ProfileScreen.routeName),
              text: 'Registrar',
            ),
            
          ],
        ),
      ),
    );
  }
}