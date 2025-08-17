import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:testando/features/login/login_screen.dart';

// Chave global para acessar o NavigatorState de qualquer lugar
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class DioFactory {
  static Dio create() {
    final dio = Dio();
    
    // Log interceptor
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    
    // Interceptor para tratar erros de autenticação
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          // Verifica se o erro é 401 (não autorizado)
          if (error.response?.statusCode == 401) {
            print('Erro 401: Usuário não autorizado. Redirecionando para login...');
            
            // Limpa os dados da sessão (opcional)
            // Você pode adicionar código para limpar tokens e dados de usuário
            // await SessionManager().removeUser();
            // await SessionManager().setToken('');
            
            // Redireciona para a tela de login
            // Isso remove todas as telas da pilha de navegação
            await navigatorKey.currentState?.pushNamedAndRemoveUntil(
              LoginScreen.routeName, // Certifique-se de que esta constante está correta
              (route) => false, // Remove todas as rotas anteriores
            );
            
            // Você também pode mostrar uma mensagem (opcional)
            // ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(
            //   const SnackBar(content: Text('Sua sessão expirou. Por favor, faça login novamente.')),
            // );
          }
          
          // Continua com o erro para outros tratamentos
          handler.next(error);
        },
      ),
    );
    
    return dio;
  }
}