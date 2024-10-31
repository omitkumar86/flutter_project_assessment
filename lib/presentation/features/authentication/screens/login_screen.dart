
import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/presentation/features/authentication/controllers/login_controller.dart';
import 'package:flutter_project_assessment/presentation/features/users/screens/users_screen.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/dimensions/app_dimensions.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';
import 'package:get/get.dart';
import '../../../common_widgets/custom_button/reusable_custom_button.dart';
import '../../../common_widgets/text_form_field_widget/app_reusable_password_text_form_field.dart';
import '../../../common_widgets/text_form_field_widget/app_reusable_text_form_field.dart';
import '../../../helper/validation_helper/validation_helper.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  LoginController loginController = Get.find<LoginController>();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    loginController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 480,
                  width: 400,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 450,
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                          alignment: Alignment.bottomCenter,
                          decoration: BoxDecoration(
                            color: AppColors.appWhiteColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0.5, 0.5),
                                  color: AppColors.appBlackColor.withOpacity(0.5),
                                  blurRadius: 4
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [

                              // SizedBox(height: 100),

                              /// For Email
                              Row(
                                children: [
                                  Text('Email', style: myStyleRobotoCustom(fontSize: 14,
                                      color: AppColors.appBlackColor, fontWeight: FontWeight.w500)),
                                  Text('*', style: myStyleRobotoCustom(fontSize: 14,
                                      color: AppColors.appRedColor, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(height: 6),

                              Obx(() => AppReusableTextFormField(
                                controller: loginController.emailController.value,
                                keyboardType: TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                hintText: 'example@gmail.com',
                                suffixIcon: const Icon(Icons.email_outlined, color: AppColors.secondaryTextColor, size: 18),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ValidationHelper.validateEmail(loginController.emailController.value.text.toString());
                                  }
                                  else{
                                    return ValidationHelper.validateEmail(value);
                                  }
                                },
                                onChanged: (value){
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                },
                              )),
                              const SizedBox(height: 15),

                              /// For Password
                              Row(
                                children: [
                                  Text('Password',
                                      style: myStyleRobotoCustom(fontSize: 14,
                                          color: AppColors.appBlackColor, fontWeight: FontWeight.w500)),
                                  Text('*',
                                      style: myStyleRobotoCustom(fontSize: 14,
                                          color: AppColors.appRedColor, fontWeight: FontWeight.w500)),
                                ],
                              ),
                              const SizedBox(height: 6),

                              Obx(() => AppReusablePasswordTextFormField(
                                controller: loginController.passwordController.value,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                hintText: '8+ characters required',
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return ValidationHelper.validatePassword(loginController.passwordController.value.text.toString());
                                  }
                                  else{
                                    return ValidationHelper.validatePassword(value);
                                  }
                                },
                                onChanged: (value){
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                },
                              )),
                              const SizedBox(height: 15),

                              /// For Remember me
                              Obx(() => Row(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      setState(() {
                                        loginController.isRemember.value = !loginController.isRemember.value;
                                      });
                                    },
                                    child: Container(
                                      height: 16,
                                      width: 16,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        border: Border.all(width: 1, color: AppColors.appPrimaryColor),
                                      ),
                                      child: loginController.isRemember.value == true ?
                                      const Icon(Icons.check_outlined, color: AppColors.appPrimaryColor, size: 14) :
                                      const SizedBox.shrink(),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  InkWell(
                                      onTap: (){
                                        setState(() {
                                          loginController.isRemember.value = !loginController.isRemember.value;
                                        });
                                      },
                                      child: Text('Remember me',
                                          style: myStyleRobotoCustom(
                                              fontSize: 13,
                                              color: AppColors.appBlackColor.withOpacity(0.5),
                                              fontWeight: FontWeight.w600))),
                                ],
                              )),
                              const SizedBox(height: AppDimensions.sizedBoxHeightTwenty),

                              /// For Sign In Button
                              ReusableCustomButtonWidget(
                                onTap: () {
                                  // if (_formKey.currentState!.validate()) {
                                  // }
                                  Get.offNamedUntil(UsersScreen.routeName, (route) => false);
                                },
                                title: Text('Sign In',
                                    style: myStyleRobotoCustom(fontSize: 14,
                                        color: AppColors.appWhiteColor, fontWeight: FontWeight.w600)),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            alignment: Alignment.center,
                            height: 120,
                            margin: const EdgeInsets.only(left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: AppColors.appPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      offset: const Offset(0.5, 0.5),
                                      color: AppColors.appBlackColor.withOpacity(0.5),
                                      blurRadius: 4
                                  )
                                ]
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Flutter Project Assessment',
                                  style: myStyleRobotoCustom(fontSize: 20, color: AppColors.appWhiteColor, fontWeight: FontWeight.w600),
                                  textAlign: TextAlign.center,
                                ),

                                Text('Sign In',
                                  style: myStyleRobotoCustom(fontSize: 20, color: AppColors.appWhiteColor, fontWeight: FontWeight.w600),),
                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
