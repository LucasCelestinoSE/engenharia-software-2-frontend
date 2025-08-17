import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:testando/data/models/user.dart';
import 'package:testando/data/repository/user_repository.dart';

abstract class ISessionManager {
    
    Future<bool> setToken(String token) async {

        return true; 
    }
    Future<String?> getToken() async {
        return null;
    }
    Future<bool> setUser(User user) async {
        return true;
    }
    Future<User?> getUser() async {
        return null;
    }
    Future<bool> removeUser() async {
        return true;
    }
    
}

class SessionManager extends ChangeNotifier implements ISessionManager {

    static const String _keyToken = 'token';
    static const String _keyUser = 'user';
    SessionManager(UserRepository userRepository);
    
    @override
    Future<bool> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_keyToken, token);
  }
    @override
    Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }
  @override
  Future<bool> setUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('user', user.toJson().toString());
  }
  Future<User?> getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString(_keyUser);
    if (userString == null) {
      return null;
    }
    Map<String, dynamic> userMap = jsonDecode(userString);
    return User(
      name: userMap['name'],
      email: userMap['email'],
      birthDate: userMap['birthDate'],
      password: userMap['password'],
    );
  }

  @override
  Future<bool> removeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_keyUser);
  }
  
  void testeLocalStorage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('teste', 'teste');
    String? teste = prefs.getString('teste');
    print(teste); 
  }
}