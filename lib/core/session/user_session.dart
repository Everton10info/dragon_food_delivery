class UserSession {
  String? id;
  String? email;
  String? token;

  UserSession({
    required this.email,
    required this.token,
  });

  UserSession.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];
    email = json['user']['email'];
    token = json['token'];
  }

  toJson() {
    return {
      'id': id,
      'email': email,
      'token': token,
    };
  }
}
