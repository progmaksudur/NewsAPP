
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/providers/app_landing_page_provider.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/services/auth_services/authentication.dart';
import 'package:news_app_with_api/services/dio_client.dart';
import 'package:news_app_with_api/services/repository/db_helper_repo.dart';
import 'package:news_app_with_api/services/repository/fatch_news.dart';

final sl = GetIt.instance;


Future<void> setupLocator()async{

  // Core
  sl.registerLazySingleton(() => DioClient());


  /////Repository
  sl.registerLazySingleton(() => GetNewsRepo(dioClient: sl()));
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => DBHelperRepo());



  //////Provider
  sl.registerFactory(() => AppHelperFunctionProvider());
  sl.registerFactory(() => LandingPageProvider());
  sl.registerFactory(() => NewsDataProvider(getNewsRepo: sl()));




  // External

  // final sharedPreferences = await SharedPreferences.getInstance();
  // sl.registerLazySingleton(() => sharedPreferences);
   sl.registerLazySingleton(() => Dio());


}