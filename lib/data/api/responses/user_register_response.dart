class UserRegisterResponse {
  final String name;
  final String email;
  final String password;
  final String date_of_birth;

  UserRegisterResponse({
    required this.name,
    required this.email,
    required this.password,
    required this.date_of_birth,
  });   

  factory UserRegisterResponse.fromJson(Map<String, dynamic> json) {
    return UserRegisterResponse(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      date_of_birth: json['date_of_birth'] as String,
    );
  }
}