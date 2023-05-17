import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class Login {
  final LoginRepository loginRepository;

  Login({required this.loginRepository});

  Future<dynamic> call(String email, String password) async {
    final result = await loginRepository.authentication(email, password);
    if (result['token'] != null) {
      return true;
    } else if (result['error'] != null) {
      return result['error'];
    }
    return false;
  }
}
