import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioexception) {
    switch (dioexception.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');
       
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
      return ServerFailure('Bad certificate with ApiServer');
      
      case DioExceptionType.badResponse:
      return ServerFailure.fromResponse(dioexception.response!.statusCode!, dioexception.response!.data);
      case DioExceptionType.cancel:
      return ServerFailure('Request cancelled');
      case DioExceptionType.connectionError:
      return ServerFailure('Connection error with ApiServer');
      case DioExceptionType.unknown:
      if(dioexception.message!.contains('SoketException')){
        return ServerFailure('No onternet connection');
      }
     return ServerFailure('Unknown error with ApiServer');


     default:
       return ServerFailure('Unknown error');

    }
  }


factory ServerFailure.fromResponse(int statusCode,dynamic response){
if(statusCode==400 || statusCode==401 || statusCode==403){
return ServerFailure(response['error']['message']);
}
else if(statusCode==404){
  return ServerFailure('Resource not found');

}
else if(statusCode==500){
  return ServerFailure('Internal server error');
 
}

else{
  return ServerFailure('Unknown error');
  
}
}

}
