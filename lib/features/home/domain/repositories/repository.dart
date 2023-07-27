import '../entities/product.dart';

abstract class HomeRepository {
  Future<List<Product>> getProducts();
}
