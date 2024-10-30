import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final Rx<TextEditingController> emailController = TextEditingController().obs;
  final Rx<TextEditingController> passwordController = TextEditingController().obs;
  RxBool isRemember = false.obs;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.value.dispose();
    passwordController.value.dispose();
  }

}