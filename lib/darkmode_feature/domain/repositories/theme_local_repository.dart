import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ThemeRepository {
  Future<Either<Failure, bool>> getThemeMode();

  Future<void> setThemeMode({required bool mode});

  //implement that the app first try to call a local function that gets the value out of the cloud.
  //if the value is null it should use the cached shared_preferences
  //if nothing is uses is should return a failure and use the system mode
  //the system mode should than be implemented inside the cached datasource and cloud data source
}
