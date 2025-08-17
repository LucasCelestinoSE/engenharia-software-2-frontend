class UserRegisterResponse {
  final String name;
  final String email;
  final String? date_of_birth; // Marque como nullable (String?)
  UserRegisterResponse({
    required this.name,
    required this.email,
    this.date_of_birth,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    try {
      return UserRegisterResponse(
        name: json['name'] as String,
        email: json['email'] as String,
        date_of_birth: json['date_of_birth'] as String?, // Marca explicitamente como String?

      );
    } catch (e) {
      print("Erro ao fazer parsing do JSON: $e");
      return UserRegisterResponse(
        name: '',
        email: '',
        date_of_birth: null,
      );
    }
  }
}