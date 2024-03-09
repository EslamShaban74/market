// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gold_prices_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoldPricesResponse _$GoldPricesResponseFromJson(Map<String, dynamic> json) =>
    GoldPricesResponse(
      timestamp: json['timestamp'] as int?,
      metal: json['metal'] as String?,
      currency: json['currency'] as String?,
      exchange: json['exchange'] as String?,
      symbol: json['symbol'] as String?,
      openTime: json['open_time'] as int?,
      price: (json['price'] as num?)?.toDouble(),
      ch: (json['ch'] as num?)?.toDouble(),
      ask: (json['ask'] as num?)?.toDouble(),
      bid: (json['bid'] as num?)?.toDouble(),
      priceGram24k: (json['price_gram_24k'] as num?)?.toDouble(),
      priceGram22k: (json['price_gram_22k'] as num?)?.toDouble(),
      priceGram21k: (json['price_gram_21k'] as num?)?.toDouble(),
      priceGram20k: (json['price_gram_20k'] as num?)?.toDouble(),
      priceGram18k: (json['price_gram_18k'] as num?)?.toDouble(),
      priceGram16k: (json['price_gram_16k'] as num?)?.toDouble(),
      priceGram14k: (json['price_gram_14k'] as num?)?.toDouble(),
      priceGram10k: (json['price_gram_10k'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GoldPricesResponseToJson(GoldPricesResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'metal': instance.metal,
      'currency': instance.currency,
      'exchange': instance.exchange,
      'symbol': instance.symbol,
      'open_time': instance.openTime,
      'price': instance.price,
      'ch': instance.ch,
      'ask': instance.ask,
      'bid': instance.bid,
      'price_gram_24k': instance.priceGram24k,
      'price_gram_22k': instance.priceGram22k,
      'price_gram_21k': instance.priceGram21k,
      'price_gram_20k': instance.priceGram20k,
      'price_gram_18k': instance.priceGram18k,
      'price_gram_16k': instance.priceGram16k,
      'price_gram_14k': instance.priceGram14k,
      'price_gram_10k': instance.priceGram10k,
    };
