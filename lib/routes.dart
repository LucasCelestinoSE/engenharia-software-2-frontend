import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';
import 'package:testando/features/main/home_page.dart';
// Remova os imports do provider daqui, não são mais necessários

class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      // A rota agora simplesmente aponta para a tela.
      // O provider será encontrado no contexto acima dela.
      LoginScreen.routeName: (context) => const LoginScreen(),
    };
  }
}