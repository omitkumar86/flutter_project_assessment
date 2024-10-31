
import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/core/utils/constants/images/app_images.dart';
import 'package:flutter_project_assessment/presentation/features/splash/controller/splash_controller.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/dimensions/app_dimensions.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/splash';
  SplashScreen({super.key});

  final SplashController splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset(AppImages.appLogo, height: 120),
              const SizedBox(height: AppDimensions.sizedBoxHeightTen),

              Shimmer.fromColors(
                  baseColor: AppColors.appPrimaryColor,
                  highlightColor: AppColors.appWhiteColor.withOpacity(0.5),
                  period: const Duration(milliseconds: 1500),
                  child: Text("Flutter Project Assessment", style: myStyleRobotoCustom(
                    fontSize: 20,
                    color: AppColors.appBlackColor,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 1,
                  ), textAlign: TextAlign.center)),
            ],
          ),
        ),
      ),
    );
  }
}
