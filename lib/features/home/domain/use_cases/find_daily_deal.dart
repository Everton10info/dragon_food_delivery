import '../entities/products.dart';
import '../repositories/repository.dart';

class FindDailyDealUseCase {
  final ProductsRepository repository;

  FindDailyDealUseCase({
    required this.repository,
  });

  Future<Products?> call() async {
    final list = await repository.getProducts();

    for (var element in list) {
      if (element.category == 'dailyDeal') {
        return element;
      }
    }
    return null;
  }
}
