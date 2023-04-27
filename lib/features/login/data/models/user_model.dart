import 'package:dragon_food/features/login/domain/entities/user.dart';

class UserModel extends User {
  UserModel(
    super.name,
    super.email,
    super.password,
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
