import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final usecase = Login(RepositoryImpl(AppHttpClientLogin()));

  test('login', () async {
    final result = await usecase('Everton', '12345678');
    expect(result, true);
  });
}
