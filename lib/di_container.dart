import 'package:dio/dio.dart';
import 'package:flutter_project_assessment/presentation/features/authentication/controllers/login_controller.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';


final sl = GetIt.instance;

Future<void> init() async {

  /// Core
  //    sl.registerLazySingleton(() => DioClient(AppConstants.baseUrl, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  /// Repository
  //    sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  /// Controller
      Get.lazyPut(() => LoginController(), fenix: true);

  /// External
      final sharedPreferences = await SharedPreferences.getInstance();
      sl.registerLazySingleton(() => sharedPreferences);
      sl.registerLazySingleton(() => Dio());
      sl.registerLazySingleton(() => LoggingInterceptor());

}