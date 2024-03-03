import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:salon/data/datasources/local/shared_preferences_service.dart';
import 'package:salon/data/datasources/remote/app_api_service.dart';
import 'package:salon/data/datasources/remote/http_client.dart';
import 'package:salon/data/repositories/products_repository_impl.dart';
import 'package:salon/domain/repositories/products_repository.dart';
import 'package:salon/domain/usecases/get_products.dart';
import 'package:salon/domain/usecases/select_product_usecase.dart';
import 'package:salon/presentation/blocs/basket/basket_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'presentation/blocs/products/products_bloc.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies(SharedPreferences sharedPreferences) async {
  /// Shared Preferences
  injector.registerSingleton(sharedPreferences);

  /// Dio client
  injector
      .registerLazySingleton<Dio>(() => BaseHttpClient.createDioHttpClient());

  /// Dependencies
  injector.registerSingleton(AppApiService(injector()));
  injector.registerSingleton(SharedPreferencesService(injector()));

  /// Repositories
  injector.registerSingleton<ProductsRepositories>(
      ProductsRepositoryImpl(injector()));

  /// UseCases
  injector.registerSingleton(GetProductsUseCase(injector()));
  injector.registerSingleton(SelectProductUseCase(injector()));

  /// Blocs
  injector.registerLazySingleton(() => ProductsBloc(injector()));
  injector.registerLazySingleton(() => BasketBloc(injector(), injector()));
}
