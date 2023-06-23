import 'dart:convert';

import '../../../../client/client.dart';
import '../../../../env/app_environment.dart';
import '../../models/user_session_model.dart';
import '../local/app_shared_preferences.dart';
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
    final UserSessionModel user = UserSessionModel.fromJson(session);
    final String token = user.token!;

    final response = await client.get(uri: url + path, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final Map<String, dynamic> result = jsonDecode(response.body);

    return result;
  }
}
