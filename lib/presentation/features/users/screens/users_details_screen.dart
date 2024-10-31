import 'package:flutter/material.dart';
import 'package:flutter_project_assessment/presentation/theme/colors/app_colors.dart';
import 'package:flutter_project_assessment/presentation/theme/dimensions/app_dimensions.dart';
import 'package:flutter_project_assessment/presentation/theme/styles/app_styles.dart';
import 'package:get/get.dart';

class UsersDetailsScreen extends StatefulWidget {
  static const String routeName = '/users_details';
  const UsersDetailsScreen({super.key});

  @override
  State<UsersDetailsScreen> createState() => _UsersDetailsScreenState();
}

class _UsersDetailsScreenState extends State<UsersDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appScaffoldColor,
      appBar: AppBar(
        backgroundColor: AppColors.appPrimaryColor,
        elevation: 2,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_outlined, size: 20,
              color: AppColors.appWhiteColor),
        ),
        title: Text('Users Details',
            style: myStyleRobotoLarge(context: context,
                color: AppColors.appWhiteColor)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.appPrimaryColor.withOpacity(0.3), width: 1.5),
                    color: AppColors.appWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0.5, 0.5),
                        blurRadius: 4,
                        color: AppColors.appBlackColor.withOpacity(0.12),
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.appSliverColor.withOpacity(0.4),
                        ),
                        child: const Icon(Icons.person, size: 40,
                          color: AppColors.appSliverColor,),
                      ),
                      const SizedBox(height: AppDimensions.sizedBoxHeightTen),

                      Text('Omit Kumar',
                          style: myStyleRobotoLarge(context: context,
                              color: AppColors.appPrimaryColor)),

                      const SizedBox(height: AppDimensions.sizedBoxHeightFifteen),

                      buildListTile(
                        context: context,
                        icon: Icons.call,
                        title: '01740383124'
                      ),

                      buildListTile(
                          context: context,
                          icon: Icons.mail,
                          title: 'omitkumar86@gmail.com'
                      ),

                      buildListTile(
                          context: context,
                          icon: Icons.language,
                          title: 'https://hello.com'
                      ),
                      buildListTile(
                          context: context,
                          icon: Icons.business,
                          title: 'Eyeconsoft'
                      ),

                      buildListTile(
                          context: context,
                          icon: Icons.location_on,
                          title: 'Shewrapara, Mirpur, Dhaka - 1216'
                      ),

                    ],
                  ),
                ),
              ],
            )
          // const Center(child: CircularProgressIndicator(color: AppColors.appPrimaryColor))
        ),
      ),
    );
  }

  ListTile buildListTile({required BuildContext context, dynamic icon, dynamic title}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      dense: true,
      leading: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.appSliverColor.withOpacity(0.4),
        ),
        child: Icon(icon, size: 15,
          color: AppColors.appSliverColor,),
      ),
      title: Text(title,
          style: myStyleRobotoMedium(context: context,
              color: AppColors.appBlackColor.withOpacity(0.6))),
    );
  }
}
