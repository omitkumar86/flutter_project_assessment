
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_assessment/core/utils/constants/texts/app_constants.dart';
import 'package:flutter_project_assessment/presentation/features/splash/screen/splash_screen.dart';
import 'package:flutter_project_assessment/presentation/routes/app_routes.dart';
import 'package:get/get.dart';
import 'di_container.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  await di.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      initialRoute: SplashScreen.routeName,
      getPages: AppRoutes.routes,
    );
  }
}