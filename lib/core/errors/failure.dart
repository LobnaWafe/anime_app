import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMsg;

  Failure(this.errorMsg);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMsg);

  factory ServerFailure.dioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection Time out");

      case DioExceptionType.sendTimeout:
        return ServerFailure("Send Time out");

      case DioExceptionType.receiveTimeout:
        return ServerFailure("Receiver Time out");

      case DioExceptionType.badCertificate:
        return ServerFailure("Bad Certificate");

      case DioExceptionType.cancel:
        return ServerFailure("Request canceled");

      case DioExceptionType.connectionError:
        return ServerFailure("Connection Error");

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioException.response?.statusCode ?? 0,
          dioException.response?.data,
        );

      case DioExceptionType.unknown:
        if (dioException.message != null &&
            dioException.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("Unexpected Error, Please try again!");
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
  // لو response null
  if (response == null) {
    return ServerFailure("Oops! Something went wrong");
  }

  // 400, 401, 403 ممكن يكون عندهم structure مختلف
  if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
    // نحاول نجيب رسالة من أكثر من مكان
    String message = "Invalid or incomplete request";
    
    if (response is Map<String, dynamic>) {
      if (response.containsKey("messages")) {
        // رسائل Validation
        message = response["messages"].values
            .expand((e) => e)
            .join("\n"); // لو array من الرسائل
      } else if (response.containsKey("error")) {
        message = response["error"].toString();
      } else if (response.containsKey("message")) {
        message = response["message"].toString();
      }
    }
    return ServerFailure(message);
  } 
  // 404
  else if (statusCode == 404) {
    if (response is Map<String, dynamic> && response.containsKey("message")) {
      return ServerFailure(response["message"].toString());
    }
    return ServerFailure("Not Found");
  } 
  // 500
  else if (statusCode == 500) {
    return ServerFailure("Internal Server Error");
  } 
  // حالات تانية
  else {
    String message = "Oops!, there was an error";
    if (response is Map<String, dynamic>) {
      if (response.containsKey("error") && response["error"] != null) {
        message = response["error"].toString();
      } else if (response.containsKey("message")) {
        message = response["message"].toString();
      }
    }
    return ServerFailure(message);
  }
}

}