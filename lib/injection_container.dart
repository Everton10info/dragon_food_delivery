import 'package:get_it/get_it.dart';

import 'core/client/client.dart';
import 'core/find_products/data/data_souces/remote/remote_data_source_impl.dart';
import 'features/categories/data/datasources/remote_data_source.dart';
import 'features/categories/data/repositories/repository_impl.dart';
import 'features/categories/domain/repositories/repository.dart';
import 'features/categories/domain/usecases/categories_usecase.dart';
import 'features/categories/presentation/bloc/categories_bloc.dart';
import 'features/home/data/data_sources/remote_data_source.dart';
import 'features/home/data/repositories/repository_impl.dart';
import 'features/home/domain/use_cases/find_daily_deal.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/login/data/data_sources/remote_data_source.dart';
import 'features/login/data/repositories/repository_impl.dart';
import 'features/login/domain/use_cases/login.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/splash/data/datasources/remote_data_source.dart';
import 'features/splash/data/repositories/repository_impl.dart';
import 'features/splash/domain/use_cases/find_products.dart';
import 'features/splash/presentation/bloc/splash_bloc.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //blocs
  getIt.registerLazySingleton<SplashBloc>(
      () => SplashBloc(usecase: getIt<SplashProductsUseCase>()));
  getIt.registerLazySingleton<HomeBloc>(() => HomeBloc(
        findproductsUsecase: getIt<FindDailyDealUseCase>(),
      ));
  getIt.registerLazySingleton<LoginBloc>(
      () => LoginBloc(usecase: getIt<Login>()));
  getIt.registerLazySingleton<CategoriesBloc>(
      () => CategoriesBloc(findCategoryUseCase: getIt<FindCategoryUseCase>()));

  //usecases
  getIt.registerLazySingleton<SplashProductsUseCase>(
      () => SplashProductsUseCase(repository: getIt<SplashRepositoryImpl>()));
  getIt.registerLazySingleton<FindDailyDealUseCase>(
      () => FindDailyDealUseCase(repository: getIt<HomeRepositoryImpl>()));
  getIt.registerLazySingleton<Login>(
      () => Login(loginRepository: getIt<LoginRepositoryImpl>()));
  getIt.registerLazySingleton<FindCategoryUseCase>(
      () => FindCategoryUseCase(repository: getIt<CategoriesRepository>()));

  //repositories
  getIt.registerLazySingleton<SplashRepositoryImpl>(
      () => SplashRepositoryImpl(splashDataSource: getIt<SplashDataSource>()));
  getIt.registerLazySingleton<HomeRepositoryImpl>(
      () => HomeRepositoryImpl(homeDataSource: getIt<HomeDataSource>()));
  getIt.registerLazySingleton<LoginRepositoryImpl>(
      () => LoginRepositoryImpl(appHttpClientLogin: getIt<LoginDataSource>()));
  getIt.registerLazySingleton<CategoriesRepository>(() =>
      CategoriesRepositoryImpl(
          categoriesDataSource: getIt<CategoriesDataSource>()));

  //datasources
  getIt.registerLazySingleton<ProductsDataSourceImpl>(
      () => ProductsDataSourceImpl(client: getIt<AppClient>()));

  getIt.registerLazySingleton<SplashDataSource>(() =>
      SplashDataSource(productsDataSource: getIt<ProductsDataSourceImpl>()));
  getIt.registerLazySingleton<HomeDataSource>(() => HomeDataSource(
        productsDataSource: getIt<ProductsDataSourceImpl>(),
      ));
  getIt.registerLazySingleton<LoginDataSource>(
      () => LoginDataSource(client: getIt<AppClient>()));
  getIt.registerLazySingleton<CategoriesDataSource>(() => CategoriesDataSource(
      productsDataSource: getIt<ProductsDataSourceImpl>()));

  //client
  getIt.registerLazySingleton(() => AppClient());
}
