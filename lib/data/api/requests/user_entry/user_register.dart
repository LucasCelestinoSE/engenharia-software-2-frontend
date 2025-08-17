import 'package:json_annotation/json_annotation.dart';

part 'user_register.g.dart';

@JsonSerializable()
class UserRegisterRequest {
  final String name;
  final String email;
  final String password;
  final String date_of_birth;
  UserRegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.date_of_birth,
  });

  factory UserRegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRegisterRequestToJson(this);
}