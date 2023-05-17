import 'package:dragon_food/core/sources/remote/client.dart';
import 'package:dragon_food/features/home/data/datas_ources/remote_data_source.dart';
import 'package:dragon_food/features/home/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/home/domain/use_cases/find_products.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  setUp(
    () async {
      await dotenv.load(fileName: '.env');
    },
  );
  test('login', () async {
    final usecase = FindProducts(
      repository: ProductsRepositoryImpl(
        appHttpClient: AppHttpClientFindProducts(
          client: AppClient(),
        ),
      ),
    );
    final result = await usecase();

    expect(result, result[0].category);
  });
}
