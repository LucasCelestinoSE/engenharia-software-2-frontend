import 'package:flutter/material.dart';
import 'package:testando/routes.dart'; // Importe seu arquivo de rotas

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        
        useMaterial3: true,
      ),
   
      initialRoute: '/',

      routes: Routes.getAppRoutesOf(context),
    );
  }
}