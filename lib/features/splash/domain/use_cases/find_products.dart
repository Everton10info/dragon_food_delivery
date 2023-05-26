import 'package:dragon_food/features/splash/domain/entities/product.dart';

import '../repositories/repository.dart';

class SplashProductsUseCase {
  final SplashRepository repository;

  SplashProductsUseCase({
    required this.repository,
  });

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
