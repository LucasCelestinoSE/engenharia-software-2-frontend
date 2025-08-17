class User {
  final String name;
  final int id;
  final String email;
  final String? dateOfBirth;
  final bool isActive;

  User({
    required this.name,
    required this.email,
    this.dateOfBirth,
    required this.isActive,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'id': id,
      'isActive': isActive,
    };
    
    // Adiciona date_of_birth apenas se não for nulo
    if (dateOfBirth != null) {
      data['date_of_birth'] = dateOfBirth;
    }
    
    return data;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      email: json['email'] as String,
      dateOfBirth: json['date_of_birth'] as String?, // Marca explicitamente como String?
      id: json['id'] as int,
      isActive: json['isActive'] as bool? ?? true, // Valor padrão true se não existir
    );
  }
}