import 'dart:convert';

import '../../../../env/app_environment.dart';
import '../../../../client/client.dart';
import 'models/products_model.dart';
import 'remote_data_source.dart';

class ProductsDataSourceImpl implements ProductsDataSource {
  final AppClient client;
  String path = '/products';
  String url = AppEnvironment.baseUrl;

  ProductsDataSourceImpl({
    required this.client,
  });
  @override
  Future<List<ProductModel>> getProducts() async {
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
