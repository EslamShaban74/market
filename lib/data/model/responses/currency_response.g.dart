// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyResponse _$CurrencyResponseFromJson(Map<String, dynamic> json) =>
    CurrencyResponse(
      success: json['success'] as bool?,
      dateTimeStamp: json['timestamp'] as int?,
      sourceCurrency: json['source'] as String?,
      currency: json['quotes'] == null
          ? null
          : CurrencyRate.fromJson(json['quotes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrencyResponseToJson(CurrencyResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'timestamp': instance.dateTimeStamp,
      'source': instance.sourceCurrency,
      'quotes': instance.currency,
    };

CurrencyRate _$CurrencyRateFromJson(Map<String, dynamic> json) => CurrencyRate(
      usdEGP: (json['USDEGP'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyRateToJson(CurrencyRate instance) =>
    <String, dynamic>{
      'USDEGP': instance.usdEGP,
    };
