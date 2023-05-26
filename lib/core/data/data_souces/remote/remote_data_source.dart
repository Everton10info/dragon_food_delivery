import 'models/products_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getProducts();
}
