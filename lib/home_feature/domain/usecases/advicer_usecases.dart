import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:dartz/dartz.dart';

class AdvicerUseCases {
  final AdvicerRepository advicerRepository = AdvicerRepositoryImpl();

  Future<Either<AdviceEntity, Failure>> getAdviceUsecase() async {
    return advicerRepository.getAdviceFromApi();
    //call function from repository to get advice
  }
}
