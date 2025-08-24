import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:testando/data/api/requests/checkins/checkin_request.dart';
import 'package:testando/data/api/requests/checkins/checkin_response.dart';
import 'package:testando/data/api/requests/reminder_request.dart';
import 'package:testando/data/api/requests/reminder_response.dart';
import 'package:testando/data/api/requests/user_entry/user_login.dart';
import 'package:testando/data/api/requests/user_entry/user_register.dart';
import 'package:testando/data/api/responses/get_reminder_response.dart';
import 'package:testando/data/api/responses/user_login_response.dart';
import 'package:testando/data/api/responses/user_register_response.dart';
import 'package:testando/data/models/user.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "http://54.147.151.107:8000")
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @POST("/login")
  Future<UserLoginResponse> login(@Body() UserLoginRequest request);
  @POST("/pessoas")
  Future<UserRegisterResponse> registerUser(@Body() UserRegisterRequest registerRequest);
  @GET("/pessoas/me")
  Future<User> me({@Header("Authorization") String? authorization});
  @POST("/pessoas/{id}/check_ins")
  Future<CheckinResponse> createCheckIn(@Header("Authorization") String? authorization, @Path("id") int userId, @Body() CheckInRequest request);
  @GET("/pessoas/{id}/check_ins")
  Future<List<CheckinResponse>> getCheckIns(@Header("Authorization") String? authorization, @Path("id") int userId);
  @POST("/pessoas/{id}/lembretes")
  Future<ReminderResponse> createReminder(@Header("Authorization") String? authorization, @Path("id") int userId, @Body() ReminderRequest request);
  @GET("/pessoas/{id}/lembretes")
  Future<List<GetReminderResponse>> getReminder(@Header("Authorization") String? authorization, @Path("id") int userId);
}
