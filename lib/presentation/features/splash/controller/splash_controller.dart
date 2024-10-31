import 'package:flutter_project_assessment/presentation/features/authentication/screens/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController implements GetxService{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 3000), () {
      Get.offNamedUntil(LoginScreen.routeName, (route) => false);
    });
  }

  /// Check Token
  bool checkToken(dynamic token) {
    if (token == null || token == "") {
      return false;
    } else {
      return true;
    }
  }

}