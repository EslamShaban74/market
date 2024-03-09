import 'package:black_market/data/model/responses/currency_response.dart';
import 'package:either_dart/either.dart';

import '../../data/model/responses/failure/failure.dart';

abstract class CurrencyRepository {
  Future<Either<Failure, CurrencyResponse>> getCurrencyExchangeRate();
}