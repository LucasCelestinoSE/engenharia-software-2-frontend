import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testando/configs/dio_factory.dart';
import 'package:testando/constants/app_theme.dart';
import 'package:testando/data/api/api_client.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/features/login/login_provider.dart';
import 'package:testando/routes.dart';
import 'package:testando/session_manager.dart';
import 'package:testando/features/reminder/providers/reminder_provider.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(
          create: (_) => ApiClient(DioFactory.create()),
        ),
        Provider<UserRepository>(
          create: (context) => UserRepository(api: context.read<ApiClient>()),
        ),
        ChangeNotifierProvider<SessionManager>(
          create: (context) => SessionManager(context.read<UserRepository>()),
        ),
        ChangeNotifierProvider<LoginProvider>(
          create: (context) => LoginProvider(
            context.read<UserRepository>(),
            context.read<SessionManager>(),
          ),
        ),
        
        // provider lembrete
        ChangeNotifierProvider<ReminderProvider>(
          create: (context) => ReminderProvider(),
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
      theme: AppTheme.lightTheme,
      initialRoute: "/",
      routes: Routes.getAppRoutes(),
    );
  }
}