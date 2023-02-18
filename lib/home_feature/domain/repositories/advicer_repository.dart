import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AdvicerRepository {
  Future<Either<AdviceEntity, Failure>> getAdviceFromApi();
}
