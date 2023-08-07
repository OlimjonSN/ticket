import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/core/network/network_info.dart';
import 'package:ticket/features/auth/data/datasource/auth_local_data.dart';
import 'package:ticket/features/auth/data/datasource/auth_remote_data.dart';
import 'package:ticket/features/auth/data/repositories/auth_repositories.dart';
import 'package:ticket/features/auth/presentation/provider/auth_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Providers
  sl.registerFactory(() => AuthProvider(authRepositories: sl()));

  // Repositories
  sl.registerLazySingleton(() => AuthRepositories(networkInfo: sl(), authLocalData: sl(), authRemoteData: sl()));

  // Data Sources
  sl.registerLazySingleton(() => AuthLocalData(sharedPreference: sl()));
  sl.registerLazySingleton(() => AuthRemoteData(dio: sl()));

  //! Core
  sl.registerLazySingleton(() => NetworkInfo(internetConnectionChecker: sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton(() => Dio(BaseOptions(baseUrl: 'http://127.0.0.1:8000/')));
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
