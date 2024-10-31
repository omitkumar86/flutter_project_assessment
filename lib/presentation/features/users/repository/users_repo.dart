
import 'package:dio/dio.dart';
import 'package:flutter_project_assessment/core/utils/constants/texts/app_constants.dart';
import 'package:flutter_project_assessment/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_project_assessment/data/datasource/remote/exception/api_error_handler.dart';
import 'package:flutter_project_assessment/data/model/base_model/api_response.dart';

class UsersRepo{
  DioClient dioClient;
  UsersRepo({required this.dioClient});

  Future<ApiResponse> getAllUsersData() async{
    try{
      Response response = await dioClient.get(
          AppConstants.allUsersUrl,
          options: Options( headers: {
            "Content-Type": "application/json",
          })
      );
      return ApiResponse.withSuccess(response);

    }catch(e){
      return ApiResponse.withError(ApiErrorHandler.getErrorResponse(error: e));
    }

  }


}