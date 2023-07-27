class UserSessionModel {
  String id = '';
  String name = '';
  String token = '';

  UserSessionModel({
    required this.id,
    required this.name,
    required this.token,
  });

  UserSessionModel.fromJson(Map<String, dynamic> json) {
    id = json['user']['id'];
    name = json['user']['email'];
    token = json['token'];
  }

  toJson() {
    return {
      'id': id,
      'email': name,
      'token': token,
    };
  }
}
