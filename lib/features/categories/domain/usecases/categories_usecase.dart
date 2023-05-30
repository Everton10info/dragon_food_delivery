// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../entities/product.dart';
import '../repositories/repository.dart';

class FindDailyDealUseCase {
  final CategoriesRepository repository;
  final String category;
  final List<Product> categoryList = [];

  FindDailyDealUseCase({
    required this.repository,
    required this.category,
  });

  Future<List<Product>> call() async {
    final list = await repository.getProducts();

    for (var element in list) {
      if (element.category == category) {
        categoryList.add(element);
      }
    }
    return categoryList;
  }
}
