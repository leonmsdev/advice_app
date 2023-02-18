import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:bloc_app/home_feature/infrastructure/exeptions/exeptions.dart';
import 'package:dartz/dartz.dart';

class AdvicerRepositoryImpl implements AdvicerRepository {
  final AdvicerRemoteDataSource advicerRemoteDataSource =
      AdvicerRemoteDataSourceImpl();

  @override
  Future<Either<AdviceEntity, Failure>> getAdviceFromApi() async {
    //Exeption wenn wir mit der Außenwelt kommunizieren

    try {
      final remoteAdvice =
          await advicerRemoteDataSource.getRandomAdviceFromApi();
      return Left(remoteAdvice);
    } catch (e) {
      if (e.runtimeType is ServerExeption) {
        return Right(ServerFailure());
      } else {
        return Right(GeneralFailure());
      }
    }
  }
}
