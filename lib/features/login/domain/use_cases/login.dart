import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class Login {
  final LoginRepository _loginRepository;

  Login(this._loginRepository);

  Future<dynamic> call(String email, String password) async {
    final result = await _loginRepository.authentication(email, password);
    if (result['token'] != null) {
      return true;
    } else if (result['error'] != null) {
      return result['error'];
    }
    return false;
  }
}
