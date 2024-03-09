class CurrencyExchangePrice {
  final bool success;
  final int dateTimeStamp;
  final String sourceCurrency;
  final Currency currency;

  CurrencyExchangePrice({
    required this.success,
    required this.dateTimeStamp,
    required this.sourceCurrency,
    required this.currency,
  });
}

class Currency {
  final double usdEGP;

  Currency({required this.usdEGP});
}
