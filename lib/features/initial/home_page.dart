import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';

// IMPORT QUE ESTÁ FALTANDO
import 'package:testando/features/reminder/pages/reminder_list_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String title = 'iMood';
  final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFD9CB),
      appBar: AppBar(
        toolbarHeight: 120,
        centerTitle: true,
        backgroundColor: const Color(0xFFDFD9CB),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('images/header.png'),
              width: 80,
              height: 80,
            ),
            Text(title),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/inital_image.png'),
              const SizedBox(height: 16),
              Text(
                'Bem-vindo ao $title!',
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Estamos aqui para ajudar você a mapear seu estado emocional',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF5EBDED),
                    foregroundColor: Color(0xFF0D171C),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                  child: Text('Começar',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      )),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}