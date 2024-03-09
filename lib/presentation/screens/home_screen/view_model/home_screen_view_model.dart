import 'package:black_market/app/utils.dart';
import 'package:black_market/data/mapper/mapper.dart';
import 'package:black_market/data/model/responses/currency_response.dart';
import 'package:black_market/data/model/responses/failure/failure.dart';
import 'package:black_market/data/model/responses/gold_prices_response.dart';
import 'package:flutter/material.dart';

import '../../../../data/model/entites/currency_exchange_price.dart';
import '../../../../data/model/entites/gold_prices.dart';
import '../../../../domain/use_cases/currency_exchange_use_case.dart';
import '../../../../domain/use_cases/gold_prices_use_case.dart';
import '../../../resources/strings_manager.dart';

class HomeViewModel extends ChangeNotifier implements HomeViewModelInputs {
  final CurrencyExchangeUseCase _currencyExchangeUseCase;
    final GoldPricesUseCase _goldPricesUseCase;
    GoldPrice? goldPrice;
    CurrencyExchangePrice? currencyExchangePrice;

  HomeViewModel(this._currencyExchangeUseCase, this._goldPricesUseCase);


  @override
  Future<void> getCurrencyExchangeRate(BuildContext context) async {
    Utils().showPopupLoading(context);
    ((await _currencyExchangeUseCase(null)).fold((Failure failure) {
      Utils().dismissDialog(context);
      Utils().displayErrorDialog(context: context, failure: failure,title: AppStrings.error);
    }, (CurrencyResponse data) {
      currencyExchangePrice = data.toCurrency();
      Utils().dismissDialog(context);
    }));
    notifyListeners();
  }

  @override
  Future<void> getGoldPrices(BuildContext context) async {
    Utils().showPopupLoading(context);
    ((await _goldPricesUseCase(null)).fold((Failure failure) {
      Utils().dismissDialog(context);
      Utils().displayErrorDialog(context: context, failure: failure,title: AppStrings.error);
    }, (GoldPricesResponse data) {
      goldPrice = data.toGoldPrice();
      Utils().dismissDialog(context);
    }));
    notifyListeners();
  }
}

abstract class HomeViewModelInputs {
  Future<void> getCurrencyExchangeRate(BuildContext context);

  Future<void> getGoldPrices(BuildContext context);
}
