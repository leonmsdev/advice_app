import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:dartz/dartz.dart';

class AdvicerUseCases {
  final AdvicerRepository advicerRepository;

  AdvicerUseCases({required this.advicerRepository});

  Future<Either<AdviceEntity, Failure>> getAdviceUsecase() async {
    return advicerRepository.getAdviceFromApi();
    //call function from repository to get advice
  }
}
