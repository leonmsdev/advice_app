import 'package:bloc_app/darkmode_feature/domain/failures/failures.dart';
import 'package:bloc_app/darkmode_feature/domain/repositories/theme_local_repository.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/datasource/theme_local_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';

//repositories use the collection of remote and local datasources and combines them to one class
class ThemeRepositoryImpl implements ThemeRepository {
  final ThemeLocalDatasource themeLocalDatasource;
  // final ThemeRemoteDatasource  //need to use the remote datasource
  ThemeRepositoryImpl({required this.themeLocalDatasource});

  @override
  Future<Either<Failure, bool>> getThemeMode() async {
    try {
      final themeMode = await themeLocalDatasource.getChachedThemeData();
      return Right(themeMode);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<void> setThemeMode({required bool mode}) {
    return themeLocalDatasource.setCacheThemeData(mode: mode);
  }
}
