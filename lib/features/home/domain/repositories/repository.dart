import '../entities/products.dart';

abstract class ProductsRepository {
  Future<List<Products>> getProducts();
}
