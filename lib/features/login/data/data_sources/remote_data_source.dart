import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppHttpClientLogin {
  String url = 'https://dragon-food-api.vercel.app/api/session';
  Future login(String email, String password) async {
    final sp = await SharedPreferences.getInstance();
    print('$email $password');
    final result = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({"email": email, "password": password}));

    if (result.statusCode == 200) {
      sp.setString('session', result.body);
      return jsonDecode(result.body);
    } else {
      print(result.statusCode);
      return result.statusCode;
    }
  }
}
