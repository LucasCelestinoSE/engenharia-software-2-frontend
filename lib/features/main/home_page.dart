import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String title = 'iMood'; // Título da página
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
      body: Center(
        child: Column(
          children: <Widget>[

            Image.asset('images/inital_image.png'),
            Text(
              'Bem-vindo ao $title',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            Text(
              textAlign: TextAlign.center,
              'Estamos aqui para ajudar você a mapear seu estado emocional e humor',
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                
              ),
            ),
            const Spacer(), // ESTA É A MÁGICA! Empurra o botão para baixo.
            SizedBox(
              width: 350,
              height: 50,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xFF5EBDED),
                  foregroundColor: Color(0xFF0D171C),
                ),
                onPressed: () {  Navigator.pushNamed(context, '/login');},
                child: Text('TextButton',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}