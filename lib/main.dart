import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/login/login_provider.dart';
import 'package:testando/routes.dart';

void main() {
  runApp(
    // Use MultiProvider para disponibilizar vários serviços/estados
    MultiProvider(
      providers: [
        // 1. Disponibiliza uma única instância do UserRepository para todo o app
        Provider<UserRepository>(
          create: (_) => UserRepository(api: ApiClient(Dio())),
        ),
        // 2. Cria o LoginProvider, que depende do UserRepository
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            // Lê o UserRepository que acabamos de disponibilizar
            context.read<UserRepository>(),
          ),
        
        ),
      ],
      child: const MyApp(),
    ),
  );
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
      // O arquivo de rotas não precisa mais prover o LoginProvider
      routes: Routes.getAppRoutes(),
    );
  }
}