class UserRegisterResponse {
  final String name;
  final String email;
  final String password;

  UserRegisterResponse({
    required this.name,
    required this.email,
    required this.password,
  });

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    return UserRegisterResponse(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}