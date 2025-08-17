import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/configs/dio_factory.dart';
import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/login/login_provider.dart';

import 'package:testando/routes.dart';
import 'package:testando/session_manager.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ApiClient provider permanece o mesmo
        Provider<ApiClient>(
          create: (_) => ApiClient(DioFactory.create()),
        ),
        
        // UserRepository provider permanece o mesmo
        Provider<UserRepository>(
          create: (context) => UserRepository(api: context.read<ApiClient>()),
        ),
        
        // Mudando de Provider para ChangeNotifierProvider
        ChangeNotifierProvider<SessionManager>(
          create: (context) => SessionManager(context.read<UserRepository>()),
        ),
        
        // LoginProvider permanece o mesmo
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            context.read<UserRepository>(),
            context.read<SessionManager>(),
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
      navigatorKey: navigatorKey,
      title: 'Meu App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/",
      // O arquivo de rotas não precisa mais prover o LoginProvider
      routes: Routes.getAppRoutes(),
    );
  }
}