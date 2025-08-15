import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';
import 'package:testando/features/main/home_page.dart';
import 'package:testando/features/profile/profile_screen.dart';
import 'package:testando/features/register/register_screen.dart';
// Remova os imports do provider daqui, não são mais necessários

class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      ProfileScreen.routeName: (context) => const ProfileScreen(),
      RegisterScreen.routeName: (context) => const RegisterScreen(),
    };
  }
}