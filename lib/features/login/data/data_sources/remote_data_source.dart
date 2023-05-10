import 'dart:convert';
import 'package:dragon_food/core/sources/remote/client.dart';

class AppHttpClientLogin {
  final AppClient client;

  String url = 'https://dragon-food-api.vercel.app/api/session';

  AppHttpClientLogin(this.client);
  Future<Map<String, dynamic>> login(String email, String password) async {
    final result = await client.post(
        uri: url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));
    return jsonDecode(result.body);
  }
}
