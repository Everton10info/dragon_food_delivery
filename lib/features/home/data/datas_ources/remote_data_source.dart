import 'dart:convert';

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
    final response = await client.get(uri: url + path, headers: {
      'Content-Type': 'application/json',
    });
    final List result = jsonDecode(response.body);

    return result.map((e) => ProductModel.fromJon(e)).toList();
  }
}
// ${userSession['user']['token']}