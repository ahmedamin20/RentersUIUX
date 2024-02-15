// import 'package:dio/dio.dart';
//
//
// abstract class Failure {
//   final String message;
//   Failure({required this.message});
// }
//
// class ServerFailure extends Failure {
//   ServerFailure({required super.message});
//
//   factory ServerFailure.fromDioError(DioError dioError)
//   {
//     switch (dioError.type) {
//       case DioErrorType.connectTimeout:
//         return ServerFailure(message: "Connection TimeOut");
//       case DioErrorType.sendTimeout:
//         return ServerFailure(message: "Send TimeOut");
//       case DioErrorType.receiveTimeout:
//         return ServerFailure(message: "Receive TimeOut");
//
//       case DioErrorType.response:
//         return ServerFailure.fromResponse(
//             dioError.response!.statusCode!, dioError.response!);
//       case DioErrorType.cancel:
//         return ServerFailure(message: "Request Canceled");
//
//       case DioErrorType.other:
//         if (dioError.message.contains("SocketException")) {
//           return ServerFailure(message: "No Internet Connection");
//         } else {
//           return ServerFailure(message: "Something Went Wrong");
//         }
//
//       default:
//         return ServerFailure(message: "Something Went Wrong");
//     }
//   }
//
//   factory ServerFailure.fromResponse(int statusCode, dynamic response) {
//     if (statusCode == 400 || statusCode == 401 || statusCode == 403)
//     {
//       if(response.data['message'] == null)
//       {
//         return ServerFailure(message: "Something Went Wrong");
//       }else if(response.data['message'] == "Unauthorized")
//       {
//         DioHelper.postData(url: '/auth/refresh', token: getToken() , data: {}).then((value)
//         {
//           print(value.statusCode);
//
//         }).catchError((error)
//         {
//           if(error is DioError)
//           {
//             print("////////////////////////////////////");
//             print(getToken());
//             print(error.response!.data);
//             print("////////////////////////////////////");
//           }
//           print(error);
//         });
//       }
//       return ServerFailure(message: response.data['message']);
//     } else if (statusCode == 404)
//     {
//       // 404 not found
//       return ServerFailure(message: "Your Request Not Found Try Again Later");
//     } else if (statusCode == 409) {
//       // 409 conflict
//       return ServerFailure(message: "Conflict Occurred");
//     } else if (statusCode == 500) {
//       // 500 internal server error
//       return ServerFailure(message: "Internal Server Error , Try Again Later");
//     } else {
//       return ServerFailure(message: "Something Went Wrong");
//     }
//   }
// }
//
// class FailureLocal extends Failure
// {
//   FailureLocal({required super.message});
// }
import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(message: "Connection TimeOut");
      case DioExceptionType.sendTimeout:
        return ServerFailure(message: "Send TimeOut");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(message: "Receive TimeOut");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!);
      case DioExceptionType.cancel:
        return ServerFailure(message: "Request Canceled");

      case DioExceptionType.unknown:
        if (dioError.message!.contains("SocketException")) {
          return ServerFailure(message: "No Internet Connection");
        } else {
          return ServerFailure(message: "Something Went Wrong");
        }

      default:
        return ServerFailure(message: "Something Went Wrong");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(message: "Something Went Wrong");
    } else if (statusCode == 404) {
      // 404 not found
      return ServerFailure(message: "Your Request Not Found Try Again Later");
    } else if (statusCode == 409) {
      // 409 conflict
      return ServerFailure(message: "Conflict Occurred");
    } else if (statusCode == 500) {
      // 500 internal server error
      return ServerFailure(message: "Internal Server Error , Try Again Later");
    } else {
      return ServerFailure(message: "Something Went Wrong");
    }
  }
}

class FailureLocal extends Failure {
  FailureLocal({required super.message});
}
