import 'package:dio/dio.dart';

abstract class Failure {
  final String error;

  const Failure(this.error);
}

class ServerFailure extends Failure {
  ServerFailure(super.error);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with API Server');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with API Server');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with API Server');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with API Server');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(dioException.response!.statusCode!, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Connection Timeout with API Server was Canceled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with API Server');

      case DioExceptionType.unknown:
        if(dioException.message!.contains('SocketException'))
        {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error, Please Try Again!');
      default:
        return ServerFailure('Oops!, There was an Error, Please Try Again Later!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response)
  {
    if(statusCode == 400 || statusCode == 401 || statusCode == 403)
    {
      return ServerFailure(response['error']['message']);
    }
    else if (statusCode == 404)
    {
      return ServerFailure('Request not Found, Please Try Again Later!');
    }
    else if(statusCode == 500)
    {
      return ServerFailure('Internal Server Error, Please Try Again Later!');
    }
    else
    {
      return ServerFailure('Oops!, There was an Error, Please Try Again Later!');
    }
  }
}
