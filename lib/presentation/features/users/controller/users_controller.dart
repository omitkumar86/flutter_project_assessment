import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_project_assessment/data/datasource/remote/dio/dio_client.dart';
import 'package:flutter_project_assessment/data/model/base_model/api_response.dart';
import 'package:flutter_project_assessment/presentation/features/users/model/users_model.dart';
import 'package:flutter_project_assessment/presentation/features/users/repository/users_repo.dart';
import 'package:get/get.dart';

class UsersController extends GetxController implements GetxService{
  final DioClient dioClient;
  final UsersRepo usersRepo;
  UsersController({required this.dioClient, required this.usersRepo});

  RxBool isLoading = false.obs;
  UsersModel? usersModel;
  RxList<UsersModel> usersList = <UsersModel>[].obs;

  /// Get Users Data
  Future<dynamic> getAllUsersData() async {
    isLoading.value = true;
    ApiResponse apiResponse = await usersRepo.getAllUsersData();

    if (apiResponse.response != null && apiResponse.response!.statusCode == 200) {

      log("apiResponse.....${apiResponse.response!.data}");


      usersModel = UsersModel.fromJson(apiResponse.response!.data);

      usersList.add(usersModel!);

      if (kDebugMode) {
        print("usersList....$usersList");
      }

    }
    isLoading.value = false;
    update();
    return usersList;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllUsersData();
  }

}