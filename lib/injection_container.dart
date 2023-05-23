import 'package:dragon_food/features/home/data/datas_ources/remote_data_source.dart';
import 'package:dragon_food/features/home/data/repositories/repository_impl.dart';
import 'package:dragon_food/features/home/domain/use_cases/find_daily_deal.dart';
import 'package:dragon_food/features/home/presentation/bloc/home_bloc.dart';
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
  getIt.registerLazySingleton<HomeBloc>(
      () => HomeBloc(usecase: getIt<FindDailyDealUseCase>()));

  //usecases
  getIt.registerLazySingleton<Login>(
      () => Login(loginRepository: getIt<LoginRepositoryImpl>()));
  getIt.registerLazySingleton<FindDailyDealUseCase>(
      () => FindDailyDealUseCase(repository: getIt<ProductsRepositoryImpl>()));

  //repositories
  getIt.registerLazySingleton<LoginRepositoryImpl>(() =>
      LoginRepositoryImpl(appHttpClientLogin: getIt<AppHttpClientLogin>()));
  getIt.registerLazySingleton<ProductsRepositoryImpl>(() =>
      ProductsRepositoryImpl(
          appHttpClient: getIt<AppHttpClientFindProducts>()));

  //datasources
  getIt.registerLazySingleton<AppHttpClientLogin>(
      () => AppHttpClientLogin(client: getIt<AppClient>()));
  getIt.registerLazySingleton<AppHttpClientFindProducts>(
      () => AppHttpClientFindProducts(client: getIt<AppClient>()));

  //client
  getIt.registerLazySingleton(() => AppClient());
}
