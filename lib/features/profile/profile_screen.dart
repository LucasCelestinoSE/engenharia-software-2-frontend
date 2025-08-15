import 'package:flutter/material.dart';
import 'package:testando/widgets/container.dart';
import 'package:testando/widgets/profile_card.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  final String title = 'iMood'; // Título da página
  static String routeName = '/user_profile';
  @override
  Widget build(BuildContext context) {
    // Obtém o LoginProvider do contexto para acessar os dados de login
    // Isso permite que a tela de login reaja a mudanças no estado do LoginProvider.
    return Scaffold(
      backgroundColor: const Color(0xFFDFD9CB),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Julho 2025"),
        backgroundColor: const Color(0xFFDFD9CB),
        
      ),
       body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          // Alinha os itens no topo da tela em vez do centro.
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           ProfileCard(name: "Lucas Celestino", age: 25, imagePath: "images/profile.png"),
           Text("Visão geral do Humor"),
           SizedBox(height: 16),
           MyContainer(),
            SizedBox(height: 60),
            Text("Termos de uso e Política de Privacidade")
          ],
        ),
      ),
    );
  }
}