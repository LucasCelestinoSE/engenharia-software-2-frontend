import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:testando/data/api/requests/checkins/checkin_response.dart';
import 'package:testando/data/repository/user_repository.dart';
import 'package:testando/session_manager.dart';
  import 'package:intl/intl.dart';

/*
 * ========================================
 * ProfileProvider -> Serve a ProfilePage e HistoryScreen
 * ========================================
 * 
 * Estou usando o profile provider para chamar metodos de checkIn pq não existe
 * Api que retorno TODOS os dados da tela de profile em específico.
 * Além disso, a HistoryScreen está linkada ao ProfilePage, 
 * dessa forma eu passo o ProfileProvider via construtor da HistoryScreen e atualmente, as 02:44 da manhã
 * DO domingo, estou tendo erros de Providers a nivel de app, para agilizar, preferi fazer dessa forma e reaproveitar o provider de Profile.
 * Mas isso, sem dúvida, é um débito técnico !
 * ========================================
 */
class ProfileProvider extends ChangeNotifier {
  final UserRepository _userRepository;
  final SessionManager sessionManager;
  List<CheckinResponse> historyCheckins = [];
    bool _isInitialized = false;

  String user = "";
  bool isLoading = true;
  String error = "";
  
  // Construtor modificado para chamar meUser automaticamente
  ProfileProvider(this._userRepository, this.sessionManager) {
    // Carrega os dados do usuário automaticamente na inicialização
    meUser();
    _init();
  }
  

  void meUser() async {
    try {
      isLoading = true;
      notifyListeners();
      
      String token = await sessionManager.getToken() ?? "";
      final userData = await _userRepository.me(token);
      await sessionManager.setUserId(userData.id);
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


  void getCheckinHistory() async {
    
    try {
      int userId = (await sessionManager.getUserId())!;
    String token = (await sessionManager.getToken())!;
    if (userId == null || token == null) {
      throw Exception('Usuário não está logado ou dados de sessão inválidos');
    }
      isLoading = true;
      notifyListeners();
      print("Carregando checkins para o usuário ID: $userId");
      historyCheckins = await _userRepository.getCheckIns(token, userId);
      print("Checkins carregados: ${historyCheckins.length}");
    } catch (e) {
      error = "Erro ao carregar check-ins: ${e.toString()}";
      print("Erro ao carregar check-ins: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
    

  }
  Future<void> _init() async {
    if (!_isInitialized) {
      getCheckinHistory();
      _isInitialized = true;
    }
  }

  void teste() {
    meUser();
  }
}