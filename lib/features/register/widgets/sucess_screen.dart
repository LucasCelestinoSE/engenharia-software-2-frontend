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
            child: Column( // Use Column para organizar os widgets verticalmente
              children: [
                Image.asset(
                  'images/verificado.png',
                  width: 200, // Ajuste o tamanho conforme necessário
                  
                ),
                const Text(
                  'Cadastro realizado com sucesso!',
                  style: TextStyle(fontSize: 24, color: Colors.black),
                ),
                const SizedBox(height: 20), // Espaçamento entre a imagem e o texto
                RoundedButton(text: "Fazer login", onPressed: () => Navigator.pushNamed(context, '/login')),
              ],
            ),
          ),
          
         
        ],
      ),
    );
  }
}