import 'dart:convert';

import '../data_sources/local/app_shared_preferences.dart';
import '../models/session_model.dart';

class Session {
  static Map<String, dynamic> user = {
    'user': 'Usuário',
    'authenticated': false,
  };
  static Future<void> getVerifyToken() async {
    final userSession = await AppSharedPreferences.getData('user-session');
    if (userSession.isNotEmpty) {
      final Map<String, dynamic> session = jsonDecode(userSession.toString());
      final UserSessionModel usermodel = UserSessionModel.fromJson(session);
      final String token = usermodel.token ?? '';
      final payload = token.split('.');

      final decodedPayload = jsonDecode(
        utf8.decode(
          base64Url.decode(
            base64Url.normalize(payload[1]),
          ),
        ),
      );
      final tokenExp = decodedPayload['exp'] * 1000;
      final dateNow = DateTime.now().millisecondsSinceEpoch;
      final name = usermodel.name;
      user = {
        'user': name,
        'authenticated': tokenExp > dateNow,
      };
    }
  }

  static logout() {
    user = {
      'user': 'Usuário',
      'authenticated': false,
    };
    AppSharedPreferences.clearData();
  }
}
