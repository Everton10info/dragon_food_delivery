import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dragon_food/core/client/client.dart';
import 'package:dragon_food/core/find_products/data/data_souces/remote/models/products_model.dart';
import 'package:dragon_food/features/home/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/home/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/home/domain/repositories/repository.dart';
import 'package:dragon_food/features/home/domain/use_cases/find_daily_deal.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class Mockproduct extends Mock implements HomeDataSource {}

void main() async {
  late Mockproduct mockProducts;
  late HomeRepository homeRepository;
  late FindDailyDealUseCase usecase;
  late AppClient http;

  setUp(
    () async {
      http = AppClient();
      mockProducts = Mockproduct();
      homeRepository = HomeRepositoryImpl(homeDataSource: mockProducts);
      usecase = FindDailyDealUseCase(repository: homeRepository);
      await dotenv.load(fileName: '.env');
    },
  );
  test('homeRepositories produtos', () async {
    when(() => mockProducts.findProducts())
        .thenAnswer((_) async => <ProductModel>[]);

    final result = await homeRepository.getProducts();

    expect(result, []);
  });
  test('usecase home daily deal ', () async {
    when(() => mockProducts.findProducts())
        .thenAnswer((_) async => <ProductModel>[
              ProductModel(
                  title: 'title',
                  category: 'dailyDeal',
                  description: 'description',
                  price: 0,
                  local: 'Casa das cucas',
                  ingredients: 'ingredients',
                  deliveryPrice: 2000,
                  cacheImage: CachedNetworkImage(
                    imageUrl: '',
                  ))
            ]);

    final result = await usecase();

    expect(result?.category, 'dailyDeal');
  });

  test('api ok ', () async {
    final list = await http.get(headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ---',
    }, uri: dotenv.env['baseUrl']!);

    expect(jsonDecode(list.body), {'error': 'Token inválido'});
  });
}
