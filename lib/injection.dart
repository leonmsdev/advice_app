import 'package:bloc_app/home_feature/application/bloc/api_request_bloc.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/domain/usecases/advicer_usecases.dart';
import 'package:bloc_app/home_feature/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:bloc_app/home_feature/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => ApiRequestBloc(usecases: sl()));

  //Usecases
  sl.registerLazySingleton(() => AdvicerUseCases(advicerRepository: sl()));

  //Repositories
  sl.registerLazySingleton<AdvicerRepository>(
      () => AdvicerRepositoryImpl(advicerRemoteDataSource: sl()));

  //Datasources
  sl.registerLazySingleton<AdvicerRemoteDataSource>(
      () => AdvicerRemoteDataSourceImpl(client: sl()));

  //Extern
  sl.registerLazySingleton(() => http.Client());
}
