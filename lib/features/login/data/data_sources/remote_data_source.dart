import 'dart:convert';
import 'package:http/http.dart' as http;

class AppHttpClientLogin {
  final http.Client client;
  String url = 'https://dragon-food-api.vercel.app/api/session';

  AppHttpClientLogin(this.client);
  Future<Map<String, dynamic>> login(String email, String password) async {
    final result = await client.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));
    return jsonDecode(result.body);
  }
}
