import 'dart:convert';

import 'package:dragon_food/core/client/client.dart';
import 'package:dragon_food/core/session/models/session_model.dart';
import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/domain/repositories/repository.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockRepoLogin extends Mock implements LoginRepository {}

void main() async {
  late MockRepoLogin mockRepo;
  late Login usecase;
  late SharedPreferences pref;
  setUp(() async {
    await dotenv.load(fileName: '.env');
    mockRepo = MockRepoLogin();
    usecase = Login(loginRepository: mockRepo);
    SharedPreferences.setMockInitialValues({});
    pref = await SharedPreferences.getInstance();
  });

  test('login', () async {
    when(() => mockRepo.authentication(any(), any()))
        .thenAnswer((_) async => {'token': '123'});

    final result = await usecase('everton@gmail.com', '12345678');

    verify(
      () => mockRepo.authentication(any(), any()),
    ).called(1);

    expect(result, true);
  });

  test('salvar e ler token da sessão', () async {
    final client = LoginDataSource(client: AppClient());
    final res = await client.login('everton@gmail.com', '12345678');

    pref.setString('session', jsonEncode(res));

    final Map<String, dynamic> session =
        jsonDecode(pref.get('session').toString());

    final UserSessionModel user = UserSessionModel.fromJson(session);

    expect(user.name, 'everton');
  });
}
