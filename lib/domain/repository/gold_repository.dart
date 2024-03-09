import 'package:black_market/data/model/responses/gold_prices_response.dart';
import 'package:either_dart/either.dart';

import '../../data/model/responses/failure/failure.dart';

abstract class GoldRepository {
  Future<Either<Failure, GoldPricesResponse>> getGoldPrices();
}