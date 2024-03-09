import 'package:black_market/app/extensions.dart';
import 'package:black_market/data/model/responses/currency_response.dart';

import '../../app/constants.dart';
import '../model/entites/currency_exchange_price.dart';
import '../model/entites/gold_prices.dart';
import '../model/responses/gold_prices_response.dart';

extension JsonToGoldPrice on GoldPricesResponse? {
  GoldPrice toGoldPrice() {
    return GoldPrice(
      timestamp: this?.timestamp.orZero() ?? Constants.zero,
      metal: this?.metal.orEmpty() ?? Constants.empty,
      currency: this?.currency.orEmpty() ?? Constants.empty,
      exchange: this?.exchange.orEmpty() ?? Constants.empty,
      symbol: this?.symbol.orEmpty() ?? Constants.empty,
      openTime: this?.openTime.orZero() ?? Constants.zero,
      price: this?.price.orZeroDouble() ?? Constants.zeroDouble,
      change: this?.ch.orZeroDouble() ?? Constants.zeroDouble,
      ask: this?.ask.orZeroDouble() ?? Constants.zeroDouble,
      bid: this?.bid.orZeroDouble() ?? Constants.zeroDouble,
      pricesGram: [
        GramPrice(
            value: this?.priceGram24k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '24k'),
        GramPrice(
            value: this?.priceGram22k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '22k'),
        GramPrice(
            value: this?.priceGram21k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '21k'),
        GramPrice(
            value: this?.priceGram20k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '20k'),
        GramPrice(
            value: this?.priceGram18k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '18k'),
        GramPrice(
            value: this?.priceGram16k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '16k'),
        GramPrice(
            value: this?.priceGram14k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '14k'),
        GramPrice(
            value: this?.priceGram10k.orZeroDouble() ?? Constants.zeroDouble,
            karat: '10k'),
      ],
    );
  }
}

extension ToCurrency on CurrencyResponse? {
  CurrencyExchangePrice toCurrency() {
    return CurrencyExchangePrice(
      success: this?.success.orFalse() ?? false,
      dateTimeStamp: this?.dateTimeStamp.orZero() ?? Constants.zero,
      sourceCurrency: this?.sourceCurrency.orEmpty() ?? Constants.empty,
      currency: Currency(
          usdEGP:
              this?.currency?.usdEGP.orZeroDouble() ?? Constants.zeroDouble),
    );
  }
}
