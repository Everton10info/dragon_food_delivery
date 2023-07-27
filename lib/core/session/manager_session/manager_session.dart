import 'dart:convert';

import 'package:flutter/material.dart';

import '../data_sources/local/app_shared_preferences.dart';
import '../models/session_model.dart';

class Session {
  static ValueNotifier user = ValueNotifier({
    'user': 'Usuário',
    'authenticated': false,
  });
  static Future<void> getVerifyToken() async {
    final userSession = await AppSharedPreferences.getData('user-session');
    if (userSession.isNotEmpty) {
      final Map<String, dynamic> session = jsonDecode(userSession.toString());
      final UserSessionModel usermodel = UserSessionModel.fromJson(session);
      final String token = usermodel.token;
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
      final name = usermodel.email.split('@');
      user.value = {
        'user': name[0],
        'authenticated': tokenExp > dateNow,
      };
    }
  }

  static logout() {
    user.value = {
      'user': 'Usuário',
      'authenticated': false,
    };
    AppSharedPreferences.clearData();
  }
}
