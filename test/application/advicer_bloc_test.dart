import 'package:bloc_app/home_feature/application/bloc/api_request_bloc.dart';
import 'package:bloc_app/home_feature/domain/entities/advice_entity.dart';
import 'package:bloc_app/home_feature/domain/usecases/advicer_usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'advicer_bloc_test.mocks.dart';

@GenerateMocks([AdvicerUseCases])
void main() {
  late ApiRequestBloc bloc;
  late MockAdvicerUseCases mockAdvicerUseCases;

  setUp(() {
    mockAdvicerUseCases = MockAdvicerUseCases();
    bloc = ApiRequestBloc(usecases: mockAdvicerUseCases);
  });

  test('Init Advicer Bloc state', () {
    //assert
    expect(bloc.state, equals(ApiRequestInitial()));
  });

  group('Test advicer Bloc states', () {
    final testAdvice = AdviceEntity(advice: 'test', id: 1);

    test('Should call usecase if event is pushed ', () async {
      //arrange
      when(mockAdvicerUseCases.getAdviceUsecase())
          .thenAnswer((realInvocation) async => Left(testAdvice));

      //act
      bloc.add(ApiRequestedEvent());
      await untilCalled(mockAdvicerUseCases.getAdviceUsecase());

      //assert
      verify(mockAdvicerUseCases.getAdviceUsecase());
      verifyNoMoreInteractions(mockAdvicerUseCases);
    });
  });
}
