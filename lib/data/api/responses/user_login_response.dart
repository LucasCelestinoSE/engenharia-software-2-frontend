class UserLoginResponse {
  final String tokenType;
  final String accessToken;

  UserLoginResponse({
    required this.tokenType,
    required this.accessToken,
  });

  factory UserLoginResponse.fromJson(Map<String, dynamic> json) {
    return UserLoginResponse(
      tokenType: json['token_type'] as String,
      accessToken: json['access_token'] as String,
    );
  }
}