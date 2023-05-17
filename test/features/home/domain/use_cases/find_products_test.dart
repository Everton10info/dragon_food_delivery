import 'dart:convert';
import 'package:dragon_food/core/sources/remote/client.dart';
import 'package:dragon_food/features/home/domain/entities/products.dart';
import 'package:dragon_food/features/home/domain/repositories/repository.dart';
import 'package:dragon_food/features/home/domain/use_cases/find_products.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockRepoGet extends Mock implements ProductsRepository {}

void main() async {
  late final MockRepoGet mockRepoProducts;
  late final FindProducts usecase;
  late final AppClient http;

  setUp(
    () async {
      http = AppClient();

      mockRepoProducts = MockRepoGet();
      usecase = FindProducts(repository: mockRepoProducts);
      await dotenv.load(fileName: '.env');
    },
  );
  test('usecase produtos', () async {
    when(() => mockRepoProducts.getProducts())
        .thenAnswer((_) async => <Products>[]);

    final result = await usecase();

    expect(result, []);
  });

  test('api ok ', () async {
    final list = await http.get(headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ---',
    }, uri: dotenv.env['baseUrl']!);

    expect(jsonDecode(list.body), {'error': 'Token inválido'});
  });
}
