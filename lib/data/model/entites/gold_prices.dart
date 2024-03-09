class GoldPrice {
  final int timestamp;
  final String metal;
  final String currency;
  final String exchange;
  final String symbol;
  final int openTime;
  final double price;
  final double change;
  final double ask;
  final double bid;
  final List<GramPrice> pricesGram;

  GoldPrice({
    required this.timestamp,
    required this.metal,
    required this.currency,
    required this.exchange,
    required this.symbol,
    required this.openTime,
    required this.price,
    required this.change,
    required this.ask,
    required this.bid,
    required this.pricesGram,
  });

}

class GramPrice {
  double value;
  String karat;

  GramPrice({required this.value, required this.karat});
}
