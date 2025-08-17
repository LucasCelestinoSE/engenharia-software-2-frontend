import 'package:flutter/material.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/session_manager.dart';

class ProfileProvider extends ChangeNotifier {
  final UserRepository _userRepository;
  final SessionManager sessionManager;
  
  String user = "";
  bool isLoading = true;
  String error = "";
  
  // Construtor modificado para chamar meUser automaticamente
  ProfileProvider(this._userRepository, this.sessionManager) {
    // Carrega os dados do usuário automaticamente na inicialização
    meUser();
  }
  
  void meUser() async {
    try {
      isLoading = true;
      notifyListeners();
      
      String token = await sessionManager.getToken() ?? "";
      final userData = await _userRepository.me(token);
      
      if (userData != null) {
        user = userData.name;
        print("Usuário carregado: ${userData.name}");
      } else {
        error = "Usuário não encontrado";
        print("Usuário não encontrado");
      }
    } catch (e) {
      error = "Erro ao carregar usuário: ${e.toString()}";
      print("Erro ao carregar usuário: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
  
  void teste() {
    meUser();
  }
}