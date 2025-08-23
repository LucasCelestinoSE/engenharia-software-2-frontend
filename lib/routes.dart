import 'package:flutter/material.dart';
import 'package:testando/features/checkins/checkin_screen.dart';
import 'package:testando/features/login/login_screen.dart';
import 'package:testando/features/initial/home_page.dart';
import 'package:testando/features/profile/profile_page.dart';
import 'package:testando/features/register/register_page.dart';
import 'package:testando/features/register/widgets/sucess_screen.dart';
// Importe as novas páginas
import 'package:testando/features/reminder/pages/add_reminder_page.dart';
import 'package:testando/features/reminder/pages/reminder_list_page.dart';


class Routes {
  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      '/': (context) => const MyHomePage(),
      LoginScreen.routeName: (context) => const LoginScreen(),
      ProfilePage.routeName: (context) => const ProfilePage(),
      RegisterPage.routeName: (context) => const RegisterPage(),
      SucessScreen.routeName: (context) => const SucessScreen(),
      CheckinScreen.routeName: (context) => const CheckinScreen(),
    };
  }
}