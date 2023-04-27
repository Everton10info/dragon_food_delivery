import 'package:dragon_food/core/utils/shared_preferences/app_shared_preferences.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class RepositoryImpl implements LoginRepository {
  final AppHttpClientLogin _appHttpClientLogin;

  RepositoryImpl(this._appHttpClientLogin);
  @override
  Future<bool> authentication(String email, String password) async {
    try {
      final result = await _appHttpClientLogin.login(email, password);
      await AppSharedPreferences.saveData('user_session', 'teste');
      //  print(AppSharedPreferences.getData('user_session'));
      return true;
    } catch (err) {
      rethrow;
    }
  }
}
