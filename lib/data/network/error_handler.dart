import 'package:dio/dio.dart';

import '../../presentation/resources/strings_manager.dart';
import '../model/responses/failure/failure.dart';

///Handle apis response error
class ErrorHandler implements Exception {
  late Failure failure;

  ///handle if error is dio or custom errors
  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = _handleError(error);
    }
  }

  ///Handle dio errors
  Failure _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.unknown:
        return DataSource.unknown.getFailure();
      default:
        return DataSource.unknown.getFailure();
    }
  }
}

///Get error message based on status code
extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.success);

      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.noContent);

      case DataSource.notFound:
        return Failure(
          ResponseCode.noFound,
          ResponseMessage.notFound,
        );

      case DataSource.internalServerError:
        return Failure(
          ResponseCode.internalServerError,
          ResponseMessage.internalServerError,
        );
      default:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.internalServerError);
    }
  }
}

///Response statuses
enum DataSource {
  success,
  noContent,
  badRequest,
  notFound,
  internalServerError,
  noInternetConnection,
  unknown,
}

///Response status codes
class ResponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int internalServerError = 500;
  static const int noFound = 404;
}

///Response messages
class ResponseMessage {
  static String success = AppStrings.success;
  static String noContent = AppStrings.noContent;
  static String internalServerError = AppStrings.internalServerError;
  static String notFound = AppStrings.notFound;
  static String unknown = AppStrings.unknownError;
}
