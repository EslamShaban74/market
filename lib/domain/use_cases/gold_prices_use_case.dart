import 'package:black_market/data/model/responses/gold_prices_response.dart';
import 'package:black_market/domain/repository/gold_repository.dart';
import 'package:either_dart/either.dart';

import '../../data/model/responses/failure/failure.dart';
import 'base_use_case.dart';

class GoldPricesUseCase implements BaseUseCase<void, GoldPricesResponse> {
  final GoldRepository _goldRepository;

  GoldPricesUseCase(this._goldRepository);

  @override
  Future<Either<Failure, GoldPricesResponse>> call(void input) async {
    return _goldRepository.getGoldPrices();
  }
}
