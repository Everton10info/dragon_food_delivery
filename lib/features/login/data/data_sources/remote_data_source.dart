import 'dart:convert';

import 'package:http/http.dart' as http;

class AppHttpClientLogin {
  String url = 'https://dragon-food-api.vercel.app/api/session';
  Future<dynamic> login(String email, String password) async {
    final result = await http.get(Uri.parse(url));

    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      return result.statusCode;
    }
  }
}
