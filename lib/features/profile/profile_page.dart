import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/profile/profile_provider.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/session_manager.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  final String title = 'iMood'; // Título da página
  static String routeName = '/user_profile';
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(
        context.read<UserRepository>(),
        context.read<SessionManager>(),
      ),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: const Color(0xFFDFD9CB),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text("Julho 2025"),
            backgroundColor: const Color(0xFFDFD9CB),
          ),
          body: SingleChildScrollView(
            child: ProfileScreen(),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 59,
            color: const Color(0xFF444343),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SvgPicture.asset(
                  'images/person_icon.svg',
                  width: 31,
                  height: 31,
                ),
                SvgPicture.asset(
                  'images/correct_icon.svg',
                  width: 31,
                  height: 31,
                ),
                SvgPicture.asset(
                  'images/notification_icon.svg',
                  width: 31,
                  height: 31,
                ),
                SvgPicture.asset(
                  'images/hand_icon.svg',
                  width: 31,
                  height: 31,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}