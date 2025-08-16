class User {
  final String name;
  final String email;
  final String birthDate;
  final String password;

  User({
    required this.name,
    required this.email,
    required this.birthDate,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'birthDate': birthDate,
      'password': password,
    };
  }
}