import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:testando/data/requests/user_entry/user_login.dart';
import 'package:testando/data/responses/user_login_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://54.147.151.107:8000")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<UserLoginResponse> login(@Body() UserLoginRequest request);
}
