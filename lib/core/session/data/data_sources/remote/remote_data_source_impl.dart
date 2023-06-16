import 'dart:convert';

import 'package:dragon_food/core/session/data/data_sources/local/app_shared_preferences.dart';

import '../../../../env/app_environment.dart';
import '../../../../client/client.dart';

import '../../models/user_session_model.dart';
import 'remote_data_source.dart';

class VerifyDataSourceImpl implements VerifyDataSource {
  final AppClient client;
  String path = '/verify-token';
  String url = AppEnvironment.baseUrl;

  VerifyDataSourceImpl({
    required this.client,
  });
  @override
  Future<Map<String, dynamic>> getVerifyToken() async {
    final userSession = await AppSharedPreferences.getData('user-session');
    final Map<String, dynamic> session = jsonDecode(userSession.toString());
    UserSessionModel user = UserSessionModel.fromJson(session);
    String token = user.token!;

    final response = await client.get(uri: url + path, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final Map<String, dynamic> result = jsonDecode(response.body);

    return result;
  }
}
