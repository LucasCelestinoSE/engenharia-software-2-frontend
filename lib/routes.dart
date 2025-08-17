import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';
import 'package:testando/features/main/home_page.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/features/register/register_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      // A rota agora simplesmente aponta para a tela.
      // O provider será encontrado no contexto acima dela.
      LoginScreen.routeName: (context) => const LoginScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
      RegisterPage.routeName: (context) => const RegisterPage(),
    };
  }
}