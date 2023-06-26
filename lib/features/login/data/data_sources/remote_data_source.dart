import 'dart:convert';

import '../../../../core/client/client.dart';
import '../../../../core/remote_config/firebase_remote_config.dart';

class LoginDataSource {
  final AppClient client;
  String path = '/session';

  LoginDataSource({
    required this.client,
  });
  Future<Map<String, dynamic>> login(String email, String password) async {
    final String url =
        await CustomRemoteConfig().find('api'); //AppEnvironment.baseUrl;
    final result = await client.post(
        uri: url + path,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password}));
    return jsonDecode(result.body);
  }
}
