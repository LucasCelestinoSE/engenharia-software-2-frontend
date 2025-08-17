import 'package:dio/dio.dart';
import 'package:testando/session_manager.dart';

class DioFactory {
  static Dio create(SessionManager sessionManager) {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Note o 'async' adicionado aqui
        final token = await sessionManager.getToken();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
    ));
    return dio;
  }
}