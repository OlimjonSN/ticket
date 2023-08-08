import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ticket/core/network/network_info.dart';
import 'package:ticket/features/auth/data/datasource/auth_local_data.dart';
import 'package:ticket/features/auth/data/datasource/auth_remote_data.dart';
import 'package:ticket/features/auth/data/repositories/auth_repositories.dart';
import 'package:ticket/features/auth/presentation/provider/auth_provider.dart';
import 'package:ticket/features/events/data/datasource/event_local_data.dart';
import 'package:ticket/features/events/data/datasource/event_remote_data.dart';
import 'package:ticket/features/events/data/repositories/event_repositories.dart';
import 'package:ticket/features/events/presentation/provider/events_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Providers
  sl.registerFactory(() => AuthProvider(authRepositories: sl()));
  sl.registerFactory(() => EventsProvider(eventsRepositories: sl()));

  // Repositories
  sl.registerLazySingleton(() => AuthRepositories(networkInfo: sl(), authLocalData: sl(), authRemoteData: sl()));
  sl.registerLazySingleton(() => EventRepositories(networkInfo: sl(), eventLocalDataSource: sl(), eventRemoteDataSource: sl()));

  // Data Sources
  sl.registerLazySingleton(() => AuthLocalData(sharedPreference: sl()));
  sl.registerLazySingleton(() => AuthRemoteData(dio: sl()));
  sl.registerLazySingleton(() => EventLocalData(sharedPreference: sl()));
  sl.registerLazySingleton(() => EventRemoteData(dio: sl()));

  //! Core
  sl.registerLazySingleton(() => NetworkInfo(internetConnectionChecker: sl()));

  BaseOptions options = BaseOptions(baseUrl: 'http://127.0.0.1:8000/');
  //! External
  final sharedPreferences = await SharedPreferences.getInstance();

  final dio = Dio(options);
  CookieJar cookiejar = CookieJar();
  dio.interceptors.add(CookieManager(cookiejar));
  sl.registerLazySingleton(() => dio);
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
