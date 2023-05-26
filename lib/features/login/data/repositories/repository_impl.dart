import 'dart:convert';
import 'package:dragon_food/core/session/user_session_model.dart';
import 'package:dragon_food/core/data/data_souces/local/shared_preferences/app_shared_preferences.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final DataSouceLogin appHttpClientLogin;

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
      UserSessionModel.fromJson(result);

      return result;
    }
  }
}
