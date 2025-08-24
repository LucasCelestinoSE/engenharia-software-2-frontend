import 'package:flutter/material.dart';
import 'package:testando/widgets/rounded_button.dart';

class SucessScreen extends StatelessWidget {
  static String routeName = "/register_sucess";

  const SucessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Image.asset(
                    'images/verificado.png',
                    width: 200,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Cadastro realizado com sucesso!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24, 
                      color: Colors.black
                    ),
                  ),
                  const SizedBox(height: 32), // Espaçamento entre a imagem e o texto
                  RoundedButton(text: "Fazer login", onPressed: () => Navigator.pushNamed(context, '/login')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}