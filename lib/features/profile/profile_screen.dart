import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/profile/profile_provider.dart';
import 'package:testando/session_manager.dart';
import 'package:testando/widgets/container.dart';
import 'package:testando/widgets/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileProvider profileProvider = context.watch<ProfileProvider>();
    SessionManager sessionManager = context.watch<SessionManager>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        // Alinha os itens no topo da tela em vez do centro.
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ProfileCard(
            name: profileProvider.user,
            age: 25,
            imagePath: "https://a.espncdn.com/i/teamlogos/soccer/500/874.png",
            isNetworkImage: true,
          ),
          Text("Visão geral do Humor"),
          SizedBox(height: 16),
          MyContainer(),
          SizedBox(height: 60),
          Text("Termos de uso e Política de Privacidade"),
          ElevatedButton(
            onPressed: () {
              // Use context.read quando você só precisa chamar uma função
              // e não precisa reconstruir o widget quando o estado mudar
              context.read<ProfileProvider>().teste();
            },
            child: Text("Fazer algo"),
          )
        ],
      ),
    );
  }
}