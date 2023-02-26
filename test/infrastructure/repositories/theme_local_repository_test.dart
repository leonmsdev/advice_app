import 'package:bloc_app/darkmode_feature/domain/failures/failures.dart';
import 'package:bloc_app/darkmode_feature/domain/repositories/theme_local_repository.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/datasource/theme_local_datasource.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/execptions/exeptions.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/repositories/theme_local_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_local_repository_test.mocks.dart';

@GenerateMocks([ThemeLocalDatasource])
void main() {
  late MockThemeLocalDatasource mockThemeLocalDatasource; //dependencies
  late ThemeRepository themeRepository; //what do we want to test

  setUp(() {
    mockThemeLocalDatasource = MockThemeLocalDatasource();
    themeRepository =
        ThemeRepositoryImpl(themeLocalDatasource: mockThemeLocalDatasource);
  });

  group('setThemeMode()', () {
    const testThemeMode = true;

    test('should call function to change theme mode in local datasource', () {
      //arrange
      when(mockThemeLocalDatasource.setCacheThemeData(mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      //act
      themeRepository.setThemeMode(mode: testThemeMode);

      //assert
      verify(mockThemeLocalDatasource.setCacheThemeData(mode: testThemeMode));
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });
  });

  group('getThemeMode()', () {
    const testThemeMode = true;

    test('should return theme mode if chached data is pressent.', () async {
      //arrange
      when(mockThemeLocalDatasource.getChachedThemeData())
          .thenAnswer((_) async => testThemeMode);
      //act
      final result = await themeRepository.getThemeMode();
      //assert
      expect(result, const Right(testThemeMode));
      verify(mockThemeLocalDatasource
          .getChachedThemeData()); //verify if this functions was called.
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });

    test('should return an CacheFailure', () async {
      //arrange
      when(mockThemeLocalDatasource.getChachedThemeData())
          .thenThrow(CacheExeption());

      //act
      final result = await themeRepository.getThemeMode();

      //assert
      expect(result, Left(CacheFailure()));
      verify(mockThemeLocalDatasource.getChachedThemeData());
      verifyNoMoreInteractions(mockThemeLocalDatasource);
    });
  });
}
