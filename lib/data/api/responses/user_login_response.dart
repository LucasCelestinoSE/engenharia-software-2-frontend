class UserLoginResponse {
  final String message;
  final String token;

  UserLoginResponse({
    required this.message,
    required this.token,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      message: json['message'] as String,
      token: json['token'] as String,
    );
  }
}