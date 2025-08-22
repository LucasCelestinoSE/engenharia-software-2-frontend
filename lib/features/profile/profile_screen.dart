import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/constants/app_fonts.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/checkins/checkin_screen.dart';
import 'package:testando/features/profile/profile_provider.dart';
import 'package:testando/session_manager.dart';
import 'package:testando/widgets/container.dart';
import 'package:testando/widgets/graphical.dart';
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
          Text("Visão semanal do Humor",
              style: TextStyle(
                fontFamily: AppFonts.epilogue,
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold
              )),
          SizedBox(height: 16),
          MyContainer(),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
             Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckinScreen(context: context),
                ),
              );
            },
            child: Text("Ver Histórico"),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}