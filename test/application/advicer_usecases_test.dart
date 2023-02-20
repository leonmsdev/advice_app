import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/failures/failures.dart';
import 'package:bloc_app/home_feature/domain/repositories/advicer_repository.dart';
import 'package:bloc_app/home_feature/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_usecases_test.mocks.dart';

@GenerateMocks([
  AdvicerRepository
]) // 2. tells dart that we want to generate a mock from the AdvicerRepository
void main() {
  // 1. get the classes and the dependencies

  // 5. define needed classes
  late AdvicerUseCases advicerUseCases;
  late MockAdvicerRepository mockAdvicerRepository;

  //6. setUp to assign dependencies / 6.1 initialise the MockObject 6.2 AdvicerUseCases
  setUp(() {
    mockAdvicerRepository = MockAdvicerRepository();
    advicerUseCases = AdvicerUseCases(advicerRepository: mockAdvicerRepository);
  });

// 3. execute "flutter packages run build_runner build --delete-conflicting-outputs " inside terminal to build classes.
// 4. a new .mock.dart file will get created

// 7. Class functioins will be tested as individual group
  group(
    'getAdviceUsecase()',
    () {
      final testAdviceEntity = AdviceEntity(advice: 'test', id: 1);

      // 8. Write test
      test('Should return the same device that is stored inside the repository',
          () async {
        //arrange (defines what is expected)
        when(mockAdvicerRepository.getAdviceFromApi()).thenAnswer(
          (_) async => Left(testAdviceEntity),
        ); //checks when the function .getAdviceFromApi() gets triggered.

        //act
        final result = await advicerUseCases.getAdviceUsecase();

        //assert (check if the repo returns left (testAdviceEntity))
        expect(result, Left(testAdviceEntity));
        verify(mockAdvicerRepository
            .getAdviceFromApi()); //verify that the function was triggered
        verifyNoMoreInteractions(
            mockAdvicerRepository); //check that we have no other communications and no ther function run after the first
      });

      test('Should return a ServerFailure ', () async {
        //arrange (defines what is expected)
        when(mockAdvicerRepository.getAdviceFromApi()).thenAnswer(
          (_) async => Right(ServerFailure()),
        ); //checks when the function .getAdviceFromApi() gets triggered.

        //act
        final result = await advicerUseCases.getAdviceUsecase();

        //assert (check if the repo returns left (testAdviceEntity))
        expect(result, Right(ServerFailure()));
        verify(mockAdvicerRepository
            .getAdviceFromApi()); //verify that the function was triggered
        verifyNoMoreInteractions(
            mockAdvicerRepository); //check that we have no other communications and no ther function run after the first
      });

      test('Should return a GeneralFailure ', () async {
        //arrange (defines what is expected)
        when(mockAdvicerRepository.getAdviceFromApi()).thenAnswer(
          (_) async => Right(GeneralFailure()),
        ); //checks when the function .getAdviceFromApi() gets triggered.

        //act
        final result = await advicerUseCases.getAdviceUsecase();

        //assert (check if the repo returns left (testAdviceEntity))
        expect(result, Right(GeneralFailure()));
        verify(mockAdvicerRepository
            .getAdviceFromApi()); //verify that the function was triggered
        verifyNoMoreInteractions(
            mockAdvicerRepository); //check that we have no other communications and no ther function run after the first
      });
    },
  );
}
