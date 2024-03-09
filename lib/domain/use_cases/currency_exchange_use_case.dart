import 'package:black_market/data/model/responses/currency_response.dart';
import 'package:either_dart/either.dart';

import '../../data/model/responses/failure/failure.dart';
import '../repository/currency_repository.dart';
import 'base_use_case.dart';

class CurrencyExchangeUseCase implements BaseUseCase<void, CurrencyResponse> {
  final CurrencyRepository _currencyRepository;

  CurrencyExchangeUseCase(this._currencyRepository);

  @override
  Future<Either<Failure, CurrencyResponse>> call(void input) async {
    return _currencyRepository.getCurrencyExchangeRate();
  }
}
