// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRegisterRequest _$UserRegisterRequestFromJson(Map<String, dynamic> json) =>
    UserRegisterRequest(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      date_of_birth: json['date_of_birth'] as String,
    );

Map<String, dynamic> _$UserRegisterRequestToJson(
        UserRegisterRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
      'date_of_birth': instance.date_of_birth,
    };
