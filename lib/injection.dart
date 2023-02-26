import 'package:bloc_app/darkmode_feature/application/theme_service.dart';
import 'package:bloc_app/darkmode_feature/domain/repositories/theme_local_repository.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/datasource/theme_local_datasource.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/repositories/theme_local_repository_impl.dart';
import 'package:bloc_app/home_feature/application/bloc/api_request_bloc.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/domain/usecases/advicer_usecases.dart';
import 'package:bloc_app/home_feature/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:bloc_app/home_feature/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Application
  sl.registerFactory(() => ApiRequestBloc(usecases: sl()));

  sl.registerLazySingleton(() => ThemeServiceImpl(themeRepository: sl()));

  //Usecases
  sl.registerLazySingleton(() => AdvicerUseCases(advicerRepository: sl()));

  //Repositories
  sl.registerLazySingleton<AdvicerRepository>(
      () => AdvicerRepositoryImpl(advicerRemoteDataSource: sl()));

  sl.registerLazySingleton<ThemeRepository>(
      () => ThemeRepositoryImpl(themeLocalDatasource: sl()));

  //Datasources
  sl.registerLazySingleton<AdvicerRemoteDataSource>(
      () => AdvicerRemoteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ThemeLocalDatasource>(
      () => ThemeLocalDatasourceImpl(sharedPreferences: sl()));
  //Extern
  sl.registerLazySingleton(() => http.Client());

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
