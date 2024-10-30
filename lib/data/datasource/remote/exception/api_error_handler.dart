import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_assessment/core/services/internet_connectivity.dart';
import 'package:flutter_project_assessment/data/model/base_model/api_response.dart';

class ApiErrorHandler {

  static ApiResponse getErrorResponse(
      {required error, bool isBinaryResponse = false}) {

    dynamic errorDescription = "";
    ApiResponse responseModel;

    if(InternetConnectivity.isConnected == false){
      ApiResponse.titleInternetWidget = "No Internet connection";
      ApiResponse.description = "Check your connection, then refresh the page.";
      responseModel = ApiResponse(
        response: null,
        message: "No internet connection",
      );

      return responseModel;
    }

    if(isBinaryResponse){
      ApiResponse.titleInternetWidget = "Something went wrong";
      return ApiResponse(response: null, message: "Unknown error occurred, Try later");
    }

    if(error is Exception){
      if(error is DioException){
        if(kDebugMode){
          print("error.error.....${error.error}");
          print("error.response.....${error.response}");
          print("error.message.....${error.message}");
          print("error.responseType.....${error.requestOptions.responseType}");
          print("error.type.....${error.type}");
        }
        switch(error.type){
          case DioExceptionType.cancel:
            errorDescription = "Request to server was cancelled";
            responseModel = ApiResponse(
              response: error.response,
              message: errorDescription,
            );
            return responseModel;
          case DioExceptionType.connectionTimeout:
            errorDescription = "Connection timeout with server";
            responseModel = ApiResponse(
              response: error.response,
              message: errorDescription,
            );
            return responseModel;
          case DioExceptionType.unknown:
            errorDescription =
            "Connection to server failed due to internet connection "; //${DioErrorType.other.name}
            responseModel = ApiResponse(
              response: error.response,
              message: errorDescription,
            );
            return responseModel;
          case DioExceptionType.receiveTimeout:
            errorDescription = "Receive timeout in connection with server";
            responseModel = ApiResponse(
              response: error.response,
              message: errorDescription,
            );
            return responseModel;
          case DioExceptionType.badResponse:
            switch (error.response!.statusCode) {
              case 404:
                errorDescription = "No data found";
                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 400:
                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 401:
                errorDescription = error.response!.data["message"];
                if (kDebugMode) {
                  print("errorDec.....$errorDescription");
                  print("errorDescription..401..$errorDescription");
                }

                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 406:
                errorDescription = error.response!.data["message"];
                if (kDebugMode) {
                  print("errorDec.....$errorDescription");
                  print("errorDescription..401..$errorDescription");
                }

                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 500:
                errorDescription = error.response!.data["message"];
                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 422:
                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              case 503:
                errorDescription = error.response!.data["message"];
                responseModel = ApiResponse(
                  response: error.response,
                  message: errorDescription,
                );
                return responseModel;
              default:
               errorDescription = "Something went wrong";
                responseModel = ApiResponse(
                  response: null,
                  message: errorDescription,
                );
                return responseModel;
            }
          default:
            responseModel = ApiResponse(
              response: null,
              message: errorDescription,
            );
            ApiResponse.titleInternetWidget = "Something went wrong";
            ApiResponse.description = "Unknown error occurred, Try later";
            return responseModel;
        }

      }
    }
    responseModel = ApiResponse(
      response: null,
      message: errorDescription,
    );
    ApiResponse.titleInternetWidget = "Something went wrong";
    ApiResponse.description = "Unknown error occurred, Try later";
    return responseModel;
  }

}
