import 'dart:convert';

import '../../../../core/env/app_environment.dart';
import '../../../../core/data/data_souces/remote/client/client.dart';

class LoginDataSource {
  final AppClient client;
  String path = '/session';
  String url = AppEnvironment.baseUrl;

  LoginDataSource({
    required this.client,
  });
  Future<Map<String, dynamic>> login(String email, String password) async {
    final result = await client.post(
        uri: url + path,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));
    return jsonDecode(result.body);
  }
}
