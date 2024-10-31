import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/core/utils/constants/images/app_images.dart';
import 'package:flutter_project_assessment/presentation/features/users/controller/users_controller.dart';
import 'package:flutter_project_assessment/presentation/features/users/screens/users_details_screen.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/dimensions/app_dimensions.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';
import 'package:get/get.dart';

class UsersScreen extends StatefulWidget {
  static const String routeName = '/users';
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final UsersController usersController = Get.find<UsersController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        elevation: 2,
        title: Text('All Users',
            style: myStyleRobotoLarge(context: context,
                color: AppColors.appWhiteColor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      Get.toNamed(UsersDetailsScreen.routeName);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.appPrimaryColor.withOpacity(0.3), width: 1.5),
                        color: AppColors.appWhiteColor,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0.5, 0.5),
                            blurRadius: 4,
                            color: AppColors.appBlackColor.withOpacity(0.12),
                          )
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        dense: true,
                        leading: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.appSliverColor.withOpacity(0.4),
                          ),
                          child: const Icon(Icons.person, color: AppColors.appSliverColor,),
                        ),
                        title: Text('Omit Kumar',
                            style: myStyleRobotoMedium(context: context,
                                color: AppColors.appPrimaryColor)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('01740383124',
                                style: myStyleRobotoSmall(context: context,
                                    fontSize: 13,
                                    color: AppColors.appBlackColor.withOpacity(0.6))),
                            Text('omitkumar86@gmail.com',
                                style: myStyleRobotoSmall(context: context,
                                    fontSize: 13,
                                    color: AppColors.appBlackColor.withOpacity(0.6))),
                            Text('Shewrapara, Mirpur, Dhaka - 1216',
                                style: myStyleRobotoSmall(context: context,
                                    fontSize: 13,
                                    color: AppColors.appBlackColor.withOpacity(0.6))),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: AppDimensions.sizedBoxHeightTen);
                },
              ),
            ],
          )
          // const Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor))
        ),
      ),
    );
  }
}
