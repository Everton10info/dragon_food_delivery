import '../entities/product.dart';

abstract class CategoriesRepository {
  Future<List<Product>> getProducts();
}
