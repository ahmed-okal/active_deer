import 'package:dio/dio.dart';
import 'package:get/get.dart';

abstract class Failure {
  final String message;
  final int? statusCode;

  Failure({required this.message, this.statusCode});

  @override
  String toString() => 'Error: $message (Code: $statusCode)';
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, super.statusCode});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          message: 'connectionTimeout'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          message: 'sendTimeout'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          message: 'receiveTimeout'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: 'badCertificate'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode ?? 0,
          e.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          message: 'requestCanceled'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          message: 'noInternetConnection'.tr,
          statusCode: e.response?.statusCode,
        );
      case DioExceptionType.unknown:
        return ServerFailure(
          message: 'unknownError'.tr,
          statusCode: e.response?.statusCode,
        );
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure(message: 'userNotFound'.tr, statusCode: statusCode);
    } else if (statusCode == 500) {
      return ServerFailure(message: 'serverProblem'.tr, statusCode: statusCode);
    } else if (statusCode == 409 ||
        statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 403) {
      return ServerFailure(
        message: response is Map<String, dynamic>
            ? response['message']
            : 'generalError'.tr,
        statusCode: statusCode,
      );
    } else {
      return ServerFailure(message: 'generalError'.tr, statusCode: statusCode);
    }
  }
}
