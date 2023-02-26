import 'package:bloc_app/darkmode_feature/application/theme_service.dart';
import 'package:bloc_app/darkmode_feature/domain/failures/failures.dart';
import 'package:bloc_app/darkmode_feature/domain/repositories/theme_local_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'theme_service_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late ThemeService themeService;
  late MockThemeRepository mockThemeRepository;

  late int listenerCount;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    themeService = ThemeServiceImpl(themeRepository: mockThemeRepository)
      ..addListener(() {
        listenerCount += 1;
      });
    listenerCount = 0;
  });

  test('check if darkmode is set as default value', () {
    //assert
    expect(themeService.isDarkModeOn, true);
  });

  group('setTheme()', () {
    const testMode = false;
    test(
        'should set the theme to the parameter it gets, and stire theme information',
        () async {
      //arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      //act
      await themeService.setTheme(mode: testMode);

      //assert
      expect(themeService.isDarkModeOn, testMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.setThemeMode(mode: testMode));
      verifyNoMoreInteractions(mockThemeRepository);
    });
  });

  group('toggleTheme()', () {
    const testMode = false;
    test('should toggle current theme mode, and store the information',
        () async {
      //arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.setThemeMode(mode: anyNamed('mode')))
          .thenAnswer((_) async => true);

      //act
      await themeService.toggleTheme();

      //assert
      expect(themeService.isDarkModeOn, testMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.setThemeMode(mode: testMode));
      verifyNoMoreInteractions(mockThemeRepository);
    });
  });

  group('init()', () {
    const testMode = true;

    test(
        'should get a theme mode from local data source and use it and notify listeners',
        () async {
      //arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode())
          .thenAnswer((realInvocation) async => const Right(testMode));

      //act
      await themeService.init();

      //assert
      expect(themeService.isDarkModeOn, testMode);
      expect(listenerCount, 1);
      verify(mockThemeRepository.getThemeMode());
    });

    test(
        'should start with darkmode if no theme is returned from local source and notify listeners',
        () async {
      //arrange
      themeService.isDarkModeOn = true;
      when(mockThemeRepository.getThemeMode())
          .thenAnswer((realInvocation) async => Left(CacheFailure()));

      //act
      await themeService.init();

      //assert
      expect(themeService.isDarkModeOn, true);
      expect(listenerCount, 1);
      verify(mockThemeRepository.getThemeMode());
    });
  });
}
