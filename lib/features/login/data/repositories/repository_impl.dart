import 'package:dragon_food/core/session/user_session.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class RepositoryImpl implements LoginRepository {
  final AppHttpClientLogin _appHttpClientLogin;

  RepositoryImpl(this._appHttpClientLogin);
  @override
  Future<bool> authentication(String email, String password) async {
    try {
      final result = await _appHttpClientLogin.login(email, password);
      final user = UserSession.fromJson(result);

      if (user.token != null) {
        return true;
      }
      return false;
    } catch (err) {
      rethrow;
    }
  }
}
