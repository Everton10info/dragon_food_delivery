class UserSessionModel {
  String? id;
  String? email;
  String? token;

  UserSessionModel({
    required this.email,
    required this.token,
  });

  UserSessionModel.fromJson(Map<String, dynamic> json) {
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
