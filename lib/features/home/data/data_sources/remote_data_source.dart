import '../../../../core/find_products/data/data_souces/remote/models/products_model.dart';
import '../../../../core/find_products/data/data_souces/remote/remote_data_source.dart';
import '../../../../core/session/data/data_sources/local/app_shared_preferences.dart';
import '../../../../core/session/data/data_sources/remote/remote_data_source.dart';

class HomeDataSource {
  final ProductsDataSource productsDataSource;
  final VerifyDataSource verifyDataSource;
  HomeDataSource({
    required this.verifyDataSource,
    required this.productsDataSource,
  });

  Future<List<ProductModel>> findProducts() async {
    return await productsDataSource.getProducts();
  }

  Future<Map<String, dynamic>> authVerify() async {
    return await verifyDataSource.getVerifyToken();
  }
}
