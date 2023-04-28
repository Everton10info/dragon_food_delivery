import 'dart:convert';

import 'package:dragon_food/features/login/data/data_sources/remote_data_source.dart';
import 'package:dragon_food/features/login/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientMock extends Mock implements AppHttpClientLogin {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences.setMockInitialValues({});
  SharedPreferences pref = await SharedPreferences.getInstance();

  test('login', () async {
    final usecase = Login(RepositoryImpl(AppHttpClientLogin()));
    final result = await usecase("everton@gmail.com", "12345678");

    expect(result, true);
  });

  test('salvar e ler token', () async {
    final http = AppHttpClientLogin();
    final res = await http.login("everton@gmail.com", "12345678");

    pref.setString('session', jsonEncode(res));

    final Map<String, dynamic> userSession =
        jsonDecode(pref.get('session').toString());

    expect(userSession['user']['email'], 'everton@gmail.com');
  });
}
