import '../model/responses/currency_response.dart';
import '../model/responses/gold_prices_response.dart';
import '../network/app_api.dart';

/// remote data source at the data layer to call APIs
abstract class RemoteDataSource {
  Future<CurrencyResponse> getCurrencyExchangeRate(String currencies);

  Future<GoldPricesResponse> getGoldPrices(String key);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final AppClientService _appClientService;

  RemoteDataSourceImpl(this._appClientService);

  @override
  Future<CurrencyResponse> getCurrencyExchangeRate(String currencies) async {
    return await _appClientService.getCurrencyExchangeRate(currencies);
  }

  @override
  Future<GoldPricesResponse> getGoldPrices(String key) async {
    return await _appClientService.getGoldPrices(key);
  }
}
