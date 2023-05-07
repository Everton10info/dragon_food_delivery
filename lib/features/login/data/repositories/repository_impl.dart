import 'dart:convert';
import 'package:dragon_food/core/session/user_session.dart';
import 'package:dragon_food/core/sources/local/shared_preferences/app_shared_preferences.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class RepositoryImpl implements LoginRepository {
  final AppHttpClientLogin _appHttpClientLogin;

  RepositoryImpl(this._appHttpClientLogin);
  @override
  Future<dynamic> authentication(String email, String password) async {
    final result = await _appHttpClientLogin.login(email, password);
    if (result['error'] != null) {
      return result;
    } else {
      AppSharedPreferences.setString('user-session', jsonEncode(result));
      UserSession.fromJson(result);

      return result;
    }
  }
}
