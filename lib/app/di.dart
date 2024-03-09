import 'package:black_market/app/constants.dart';
import 'package:black_market/data/repository/currency_repository_impl.dart';
import 'package:black_market/data/repository/gold_repository_impl.dart';
import 'package:black_market/domain/repository/currency_repository.dart';
import 'package:black_market/domain/repository/gold_repository.dart';
import 'package:black_market/domain/use_cases/currency_exchange_use_case.dart';
import 'package:black_market/domain/use_cases/gold_prices_use_case.dart';
import 'package:black_market/presentation/screens/home_screen/view_model/home_screen_view_model.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../data/data_source/remote_data_source.dart';
import '../data/network/app_api.dart';
import '../data/network/dio.dart';
import '../data/network/network_info.dart';

final getItInstance = GetIt.instance;

///Create dependencies required for application
Future<void> initAppModule() async {

  // Register DioFactory as a lazy singleton
  getItInstance.registerLazySingleton<DioFactory>(() => DioFactory());

  // Create Dio instances for currency and gold
  Dio currencyApiKey = await getItInstance<DioFactory>()
      .getDio(NetworkConstants.currencyUrl, NetworkConstants.currencyApiKey);

  Dio goldApiKey = await getItInstance<DioFactory>()
      .getDio(NetworkConstants.goldUrl, NetworkConstants.goldApiKey);

  // Register AppClientService instances as lazy singletons with named instances
  getItInstance.registerLazySingleton<AppClientService>(
          () => AppClientService(currencyApiKey),
      instanceName: 'CurrencyService');

  getItInstance.registerLazySingleton<AppClientService>(
          () => AppClientService(goldApiKey),
      instanceName: 'GoldService');

  // Now register NetworkInfo and RemoteDataSource
  getItInstance.registerLazySingleton<NetworkInfo>(
          () => NetworkInfoImpl(InternetConnectionChecker()));

  // Ensure that AppClientService instances are registered before this
  getItInstance.registerLazySingleton<RemoteDataSource>(
          () => RemoteDataSourceImpl(getItInstance<AppClientService>(instanceName: 'CurrencyService')));
}


initHomeModule() {
  getItInstance.registerLazySingleton<GoldRepository>(() => GoldRepositoryImpl(
        getItInstance<NetworkInfo>(),
        getItInstance<RemoteDataSource>(),
      ));

  getItInstance
      .registerLazySingleton<CurrencyRepository>(() => CurrencyRepositoryImpl(
            getItInstance<NetworkInfo>(),
            getItInstance<RemoteDataSource>(),
          ));

  if (!GetIt.I.isRegistered<GoldPricesUseCase>()) {
    getItInstance.registerFactory<GoldPricesUseCase>(
        () => GoldPricesUseCase(getItInstance<GoldRepository>()));
  }
  if (!GetIt.I.isRegistered<CurrencyExchangeUseCase>()) {
    getItInstance.registerFactory<CurrencyExchangeUseCase>(
        () => CurrencyExchangeUseCase(getItInstance<CurrencyRepository>()));
  }
  if (!GetIt.I.isRegistered<HomeViewModel>()) {
    getItInstance.registerFactory<HomeViewModel>(() => HomeViewModel(
        getItInstance<CurrencyExchangeUseCase>(),
        getItInstance<GoldPricesUseCase>()));
  }
}
