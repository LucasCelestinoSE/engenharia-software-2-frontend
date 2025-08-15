import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:testando/providers/registro_provider.dart'; // Importe o provider
import 'package:testando/recursosDeApoio.dart';
import 'package:testando/registro.dart';
import 'package:testando/data/repository/registro_repository.dart';
import 'package:testando/data/api/api_service.dart';
import 'package:testando/termoDeUso.dart';

// Certifique-se de que o setup do GetIt está aqui
final GetIt getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerLazySingleton<UserRepository>(() => UserRepository(getIt<ApiService>()));
}

void main() {
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MenuInicialScreen(), // Nova tela inicial
    );
  }
}

class MenuInicialScreen extends StatelessWidget {
  const MenuInicialScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Inicial'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // AQUI está a alteração:
                // O Provider é criado antes de navegar para a tela.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                      create: (_) => RegistrationProvider(getIt<UserRepository>()),
                      child: const RegistroScreen(),
                    ),
                  ),
                );
              },
              child: const Text('Ir para a Tela de Registro'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RecursosDeApoioScreen()),
                );
              },
              child: const Text('Ir para Recursos de Apoio'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TermosDeUsoScreen()),
                );
              },
              child: const Text('Ir para Termos de Uso'),
            ),
          ],
        ),
      ),
    );
  }
}