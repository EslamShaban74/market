import 'package:json_annotation/json_annotation.dart';

part 'gold_prices_response.g.dart';

@JsonSerializable()
class GoldPricesResponse {
  @JsonKey(name: 'timestamp')
  final int? timestamp;
  @JsonKey(name: 'metal')
  final String? metal;
  @JsonKey(name: 'currency')
  final String? currency;
  @JsonKey(name: 'exchange')
  final String? exchange;
  @JsonKey(name: 'symbol')
  final String? symbol;
  @JsonKey(name: 'open_time')
  final int? openTime;
  @JsonKey(name: 'price')
  final double? price;
  @JsonKey(name: 'ch')
  final double? ch;
  @JsonKey(name: 'ask')
  final double? ask;
  @JsonKey(name: 'bid')
  final double? bid;
  @JsonKey(name: 'price_gram_24k')
  final double? priceGram24k;
  @JsonKey(name: 'price_gram_22k')
  final double? priceGram22k;
  @JsonKey(name: 'price_gram_21k')
  final double? priceGram21k;
  @JsonKey(name: 'price_gram_20k')
  final double? priceGram20k;
  @JsonKey(name: 'price_gram_18k')
  final double? priceGram18k;
  @JsonKey(name: 'price_gram_16k')
  final double? priceGram16k;
  @JsonKey(name: 'price_gram_14k')
  final double? priceGram14k;
  @JsonKey(name: 'price_gram_10k')
  final double? priceGram10k;

  GoldPricesResponse({
     this.timestamp,
     this.metal,
     this.currency,
     this.exchange,
     this.symbol,
     this.openTime,
     this.price,
     this.ch,
     this.ask,
     this.bid,
     this.priceGram24k,
     this.priceGram22k,
     this.priceGram21k,
     this.priceGram20k,
     this.priceGram18k,
     this.priceGram16k,
     this.priceGram14k,
     this.priceGram10k,
  });

  factory GoldPricesResponse.fromJson(Map<String, dynamic> json) => _$GoldPricesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GoldPricesResponseToJson(this);
}
