class Constants {
  static const String empty = "";
  static const int zero = 0;
  static const double zeroDouble = 0.0;
}

/// Network Constants
class NetworkConstants {
  static const String empty = "";
  static const int apiTimeout = 60000;
  static const int zero = 0;
  static const double zeroDouble = 0.0;

  static const String apiKey = "apiKey";

  /// two Urls that used to call API
  static const String currencyUrl =
      "https://api.apilayer.com/currency_data/live";
  static const String goldUrl = "https://www.goldapi.io/api/XAU/EGP";

  /// api key for currency exchange rate
  static const String currencyApiKey = r"u4FKpw63ZWTVxPkHfZYIQ4T3bFf1f8ao";
  static const String currenciesHeader = "currencies";
  static const String currencies = "USD,EGP";

  /// api key for gold prices
  static const String goldApiKeyHeader = "x-access-token";
  static const String goldApiKey = r"goldapi-1fkj14rlspblt59-io";
}
