import 'package:dragon_food/features/login/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/login/domain/use_cases/login.dart';
import 'package:dragon_food/features/login/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import 'core/sources/remote/client.dart';
import 'features/login/data/data_sources/remote_data_source.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //blocs
  getIt.registerLazySingleton<LoginBloc>(
      () => LoginBloc(usecase: getIt<Login>()));
  //usecases
  getIt.registerLazySingleton<Login>(
      () => Login(loginRepository: getIt<LoginRepositoryImpl>()));
  //repositories
  getIt.registerLazySingleton<LoginRepositoryImpl>(() =>
      LoginRepositoryImpl(appHttpClientLogin: getIt<AppHttpClientLogin>()));
  //datasources
  getIt.registerLazySingleton<AppHttpClientLogin>(
      () => AppHttpClientLogin(client: getIt<AppClient>()));
  //client
  getIt.registerLazySingleton(() => AppClient());
}
