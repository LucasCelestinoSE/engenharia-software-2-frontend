import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';
import 'package:testando/features/initial/home_page.dart';
import 'package:testando/features/profile/profile_page.dart';
import 'package:testando/features/register/register_page.dart';
import 'package:testando/features/register/widgets/sucess_screen.dart';

class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      // A rota agora simplesmente aponta para a tela.
      // O provider será encontrado no contexto acima dela.
      LoginScreen.routeName: (context) => const LoginScreen(),
      ProfilePage.routeName: (context) => const ProfilePage(),
      RegisterPage.routeName: (context) => const RegisterPage(),
      SucessScreen.routeName: (context) => const SucessScreen(),
    };
  }
}