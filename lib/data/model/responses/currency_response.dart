import 'package:json_annotation/json_annotation.dart';

part 'currency_response.g.dart';

@JsonSerializable()
class CurrencyResponse {
  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "timestamp")
  int? dateTimeStamp;

  @JsonKey(name: "source")
  String? sourceCurrency;

  @JsonKey(name: "quotes")
  CurrencyRate? currency;

  CurrencyResponse(
      {this.success, this.dateTimeStamp, this.sourceCurrency, this.currency});

  factory CurrencyResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrencyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyResponseToJson(this);
}

@JsonSerializable()
class CurrencyRate {
  @JsonKey(name: r"USDEGP")
  double? usdEGP;

  CurrencyRate({this.usdEGP});

  factory CurrencyRate.fromJson(Map<String, dynamic> json) =>
      _$CurrencyRateFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyRateToJson(this);
}
