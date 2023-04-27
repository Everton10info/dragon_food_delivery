import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class Login {
  final LoginRepository _loginRepository;

  Login(this._loginRepository);

  Future<bool> call(String email, String password) async {
    return await _loginRepository.authentication(email, password);
  }
}
