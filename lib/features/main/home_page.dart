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
        toolbarHeight: 140,
        centerTitle: true,
        backgroundColor: const Color(0xFFDFD9CB),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage('images/header.png'),
              width: 94,
              height: 99,
            ),
            Text(title),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/inital_image.png'),
              const SizedBox(height: 16),
              Text(
                'Bem-vindo ao $title',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              Text(
                textAlign: TextAlign.center,
                'Estamos aqui para ajudar você a mapear seu estado emocional e ola',
                style: TextStyle(
                  fontSize: 24,
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
              const SizedBox(height: 16),
              SizedBox(
                width: 350,
                height: 50,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey[600],
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, ReminderListPage.routeName);
                  },
                  child: Text('Testar Lembretes',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
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