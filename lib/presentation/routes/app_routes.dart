
import 'package:flutter_project_assessment/presentation/features/authentication/screens/login_screen.dart';
import 'package:flutter_project_assessment/presentation/features/users/screens/users_details_screen.dart';
import 'package:flutter_project_assessment/presentation/features/users/screens/users_screen.dart';
import 'package:get/get.dart';
import '../features/splash/screen/splash_screen.dart';

class AppRoutes {
   static final routes = [
     GetPage(name: SplashScreen.routeName, page: () => const SplashScreen()),
     GetPage(name: LoginScreen.routeName, page: () => const LoginScreen(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 500)),
     GetPage(name: UsersScreen.routeName, page: () => const UsersScreen(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 500)),
     GetPage(name: UsersDetailsScreen.routeName, page: () => const UsersDetailsScreen(), transition: Transition.rightToLeft, transitionDuration: const Duration(milliseconds: 500)),
  ];
}