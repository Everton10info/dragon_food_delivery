import 'dart:convert';
import 'package:dragon_food/core/session/user_session.dart';
import 'package:dragon_food/core/sources/local/shared_preferences/app_shared_preferences.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final AppHttpClientLogin appHttpClientLogin;

  LoginRepositoryImpl({
    required this.appHttpClientLogin,
  });
  @override
  Future<dynamic> authentication(String email, String password) async {
    final result = await appHttpClientLogin.login(email, password);
    if (result['error'] != null) {
      return result;
    } else {
      AppSharedPreferences.setString('user-session', jsonEncode(result));
      UserSession.fromJson(result);

      return result;
    }
  }
}
