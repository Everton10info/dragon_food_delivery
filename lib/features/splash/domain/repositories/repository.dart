import '../entities/product.dart';

abstract class SplashRepository {
  Future<List<Product>> getProducts();
}
