import 'package:dio/dio.dart';
import 'dart:io';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'Bad Certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response?.statusCode,
          response: dioException.response?.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: 'No internet connection, please try again!',
        );
      case DioExceptionType.unknown:
        if (dioException.error is SocketException) {
          return ServerFailure(
            errMessage: 'No internet connection, please check your network',
          );
        }
        return ServerFailure(
          errMessage: 'Unexpected error, please try again later!',
        );
    }
  }

  factory ServerFailure.fromResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 422 ||
        statusCode == 409 ||
        statusCode == 424 ||
        statusCode == 404) {
      return ServerFailure(
        errMessage:
            response['message'] ?? 'Unexpected error, please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Server error, please try later!');
    } else if (statusCode == 403) {
      //Helper.expiredToken();
      throw ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 413) {
      return ServerFailure(
        errMessage: 'Image is too large, please choose a smaller one.',
      );
    } else if (statusCode == 404) {
      return ServerFailure(
        errMessage: 'Your request not found, Please try later!',
      );
    } else if (statusCode == 429) {
      return ServerFailure(
        errMessage: 'Too many requests, please try again later',
      );
    } else {
      return ServerFailure(
        errMessage: 'Oops there was an error, please try later!',
      );
    }
  }
}
