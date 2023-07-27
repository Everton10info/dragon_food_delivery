import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  static Future<void> setString(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static Future<String> getData(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key) ?? '';
  }

  static Future<bool> clearData() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }
}
