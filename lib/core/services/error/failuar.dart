import 'dart:convert';

import 'package:dio/dio.dart';

abstract class Failure
{
  final String message;
  final int ? code;

  Failure({required this.message , this.code});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message , super.code});

  factory ServerFailure.fromDioError(DioException dioError, {bool? login}) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection TimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send TimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive TimeOut");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!, login ?? false);
      case DioExceptionType.cancel:
        return ServerFailure(message: "Request Canceled");

      // case DioExceptionType.unknown:
      //   if (dioError.message!.contains("SocketException")) {
      //     return ServerFailure(message: "No Internet Connection");
      //   } else {
      //     return ServerFailure(message: "Something Went Wrong");
      //   }

      default:
        return ServerFailure(message: "Something Went Wrong");
    }
  }

  factory ServerFailure.fromResponse(
      int statusCode, dynamic response, bool login) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (login)
      {
        return ServerFailure(
          code: statusCode,
            message: response.data['verified'].toString() != "null"
                ? "${response.data['verified']} , ${response.data['message']}"
                : response.data['message'].toString());
      } else
      {
        return ServerFailure(message: response.data['message']);
      }
    } else if (statusCode == 404 || statusCode == 429) {
      // 404 not found
      return ServerFailure(message:  response.data['message']);
    } else if (statusCode == 409) {
      // 409 conflict
      return ServerFailure(message: "Conflict Occurred");
    } else if (statusCode == 500) {
      // 500 internal server error
      return ServerFailure(message: "Internal Server Error , Try Again Later");
    } else if (statusCode == 422) {
      String message = jsonEncode(response.data['data']);
      message = message.replaceAll("{", "");
      message = message.replaceAll("}", "");
      message = message.replaceAll('"', "");
      message = message.replaceAll(":", " : ");
      message = message.replaceAll(",", "\n");
      return ServerFailure(message: message);
    } else {
      return ServerFailure(message: "Something Went Wrong");
    }
  }
}


class FailureLocal extends Failure {
  FailureLocal({required super.message});
}
