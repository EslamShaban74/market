import 'package:either_dart/either.dart';

import '../../data/model/responses/failure/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}
