class UserSession {
  final String id;
  final String email;
  final String token;

  UserSession({
    required this.id,
    required this.email,
    required this.token,
  });

  static fromJson(json) {
    return UserSession(
      id: json['id'],
      email: json['email'],
      token: json['token'],
    );
  }

  toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
    };
  }
}
