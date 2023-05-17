import 'dart:convert';

import 'package:dragon_food/core/session/user_session.dart';
import 'package:dragon_food/core/sources/local/shared_preferences/app_shared_preferences.dart';

import '../../../../core/env/app_environment.dart';
import '../../../../core/sources/remote/client.dart';
import '../models/products_model.dart';

class AppHttpClientFindProducts {
  final AppClient client;
  String path = '/products';
  String url = AppEnvironment.baseUrl;

  AppHttpClientFindProducts({
    required this.client,
  });
  Future getProducts() async {
    UserSession user = UserSession.fromJson(
      (jsonDecode(
        await AppSharedPreferences.getData('user-session'),
      )),
    );

    final response = await client.get(uri: url + path, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${user.token}',
    });
    final List result = jsonDecode(response.body);

    return result.map((e) => ProductModel.fromJon(e)).toList();
  }
}
// ${userSession['user']['token']}