import '../entities/product.dart';
import '../repositories/repository.dart';

class FindDailyDealUseCase {
  final HomeRepository repository;

  FindDailyDealUseCase({
    required this.repository,
  });

  Future<Product?> call() async {
    final list = await repository.getProducts();

    for (var element in list) {
      if (element.category == 'dailyDeal') {
        return element;
      }
    }
    return null;
  }
}
