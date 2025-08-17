import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/register/register_provider.dart';
import 'package:testando/features/register/register_screen.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  final String title = 'iMood';
  static String routeName = '/register';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProvider(
        context.read<UserRepository>(),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFDFD9CB),
        appBar: AppBar(
          backgroundColor: const Color(0xFFDFD9CB),
        ),
        body:  RegisterScreen(),
      ),
    );
  }
}