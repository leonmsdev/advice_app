import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/infrastructure/datasources/advicer_remote_datasource.dart';
import 'package:bloc_app/home_feature/infrastructure/exeptions/exeptions.dart';
import 'package:bloc_app/home_feature/infrastructure/models/advice_model.dart';
import 'package:bloc_app/home_feature/infrastructure/repositories/advicer_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_repository_test.mocks.dart';

@GenerateMocks([AdvicerRemoteDataSource])
void main() {
  late MockAdvicerRemoteDataSource mockAdvicerRemoteDataSource;
  late AdvicerRepository advicerRepository;

  setUp(() {
    mockAdvicerRemoteDataSource = MockAdvicerRemoteDataSource();
    advicerRepository = AdvicerRepositoryImpl(
        advicerRemoteDataSource: mockAdvicerRemoteDataSource);
  });

  group('getAdviceFromApi()', () {
    final testAdviceModel = AdviceModel(advice: "test", id: 1);
    final AdviceEntity testAdvice = testAdviceModel;

    test(
        'Should return remote data if the call to remote datasource is successful',
        () async {
      //arrange
      when(mockAdvicerRemoteDataSource.getRandomAdviceFromApi())
          .thenAnswer((_) async => testAdviceModel);

      //act
      final result = await advicerRepository.getAdviceFromApi();

      //assert
      verify(mockAdvicerRemoteDataSource
          .getRandomAdviceFromApi()); //verify if function was called
      expect(result, Left(testAdvice));
      verifyNoMoreInteractions(mockAdvicerRemoteDataSource);
    });

    test('Should return ServerFailure', () async {
      //arrange
      when(mockAdvicerRemoteDataSource.getRandomAdviceFromApi())
          .thenThrow(ServerExeption());

      //act
      final result = await advicerRepository.getAdviceFromApi();

      //assert
      verify(mockAdvicerRemoteDataSource
          .getRandomAdviceFromApi()); //verify if function was called
      expect(result, Right(ServerFailure()));
      verifyNoMoreInteractions(mockAdvicerRemoteDataSource);
    });

    test('Should return GeneralFailure', () async {
      //arrange
      when(mockAdvicerRemoteDataSource.getRandomAdviceFromApi())
          .thenThrow(Exception());

      //act
      final result = await advicerRepository.getAdviceFromApi();

      //assert
      verify(mockAdvicerRemoteDataSource
          .getRandomAdviceFromApi()); //verify if function was called
      expect(result, Right(GeneralFailure()));
      verifyNoMoreInteractions(mockAdvicerRemoteDataSource);
    });
  });
}
