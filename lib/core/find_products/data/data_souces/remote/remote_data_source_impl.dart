import 'dart:convert';

import '../../../../client/client.dart';
import '../../../../remote_config/firebase_remote_config.dart';
import 'models/products_model.dart';
import 'remote_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final AppClient client;
  String path = '/products';

  ProductsDataSourceImpl({
    required this.client,
  });
  @override
  Future<List<ProductModel>> getProducts() async {
    final String url = await CustomRemoteConfig().find('api');
    if (ProductModel.productsCache.isNotEmpty) {
      return ProductModel.productsCache;
    }
    final response = await client.get(uri: url + path, headers: {
      'Content-Type': 'application/json',
    });

    final List result = jsonDecode(response.body);
    ProductModel.productsCache =
        result.map((e) => ProductModel.fromJon(e)).toList();

    return ProductModel.productsCache;
  }
}
