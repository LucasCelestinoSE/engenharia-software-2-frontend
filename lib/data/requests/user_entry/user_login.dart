import 'package:json_annotation/json_annotation.dart';

part 'user_login.g.dart';

@JsonSerializable()
class UserLoginRequest {
  final String email;
  final String password;

  UserLoginRequest({required this.email, required this.password});

  factory UserLoginRequest.fromJson(Map<String, dynamic> json) =>
      _$UserLoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginRequestToJson(this);
}