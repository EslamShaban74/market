import 'package:black_market/app/constants.dart';
import 'package:black_market/data/model/responses/currency_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/responses/gold_prices_response.dart';

part 'app_api.g.dart';

///api service abstract class that handle apis calls using retrofit
@RestApi(baseUrl: NetworkConstants.currencyUrl)
abstract class AppClientService {
  factory AppClientService(Dio dio, {String baseUrl}) = _AppClientService;

  @GET(NetworkConstants.currencyUrl)
  Future<CurrencyResponse> getCurrencyExchangeRate(
    @Query(NetworkConstants.currenciesHeader) String baseCurrency,
  );

  @GET(NetworkConstants.goldUrl)
  Future<GoldPricesResponse> getGoldPrices(
      @Header(NetworkConstants.goldApiKeyHeader) String key);
}
