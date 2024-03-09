import 'package:black_market/app/constants.dart';
import 'package:black_market/data/data_source/remote_data_source.dart';
import 'package:black_market/data/model/responses/currency_response.dart';
import 'package:black_market/data/model/responses/failure/failure.dart';
import 'package:black_market/data/model/responses/gold_prices_response.dart';
import 'package:black_market/data/network/network_info.dart';
import 'package:black_market/domain/repository/gold_repository.dart';
import 'package:either_dart/either.dart';

import '../network/error_handler.dart';

class GoldRepositoryImpl extends GoldRepository {
  final NetworkInfo _networkInfo;
  final RemoteDataSource _remoteDataSource;

  GoldRepositoryImpl(this._networkInfo, this._remoteDataSource);

  @override
  Future<Either<Failure, GoldPricesResponse>> getGoldPrices() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getGoldPrices(NetworkConstants.goldApiKey);
        return Right(response);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
