import 'package:dragon_food/features/home/domain/entities/products.dart';
import 'package:dragon_food/features/home/domain/repositories/repository.dart';

class FindProducts {
  final ProductsRepository repository;

  FindProducts({
    required this.repository,
  });

  Future<List<Products>> call() async {
    return await repository.getProducts();
  }
}
