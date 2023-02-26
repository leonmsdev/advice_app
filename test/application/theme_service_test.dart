import 'package:bloc_app/darkmode_feature/application/theme_service.dart';
import 'package:bloc_app/darkmode_feature/domain/repositories/theme_local_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'theme_service_test.mocks.dart';

@GenerateMocks([ThemeRepository])
void main() {
  late ThemeService themeService;
  late MockThemeRepository mockThemeRepository;

  setUp(() {
    mockThemeRepository = MockThemeRepository();
    themeService = ThemeServiceImpl(themeRepository: mockThemeRepository);
  });

  test(
      'check if darkmode is set as default value',
      () => {
            //assert
            expect(themeService.isDarkModeOn, true)
          });

  group('setTheme()', () {
    final themeService = ThemeServiceImpl(themeRepository: mockThemeRepository);

    test('test if the value changed from the default value', () {
      //arrange

      //act

      //assert
    });
  });

  group('toggleTheme()', () {
    final themeService = ThemeServiceImpl(themeRepository: mockThemeRepository);

    test('test if the value changed from the default value', () {
      //arrange

      //act

      //assert
    });
  });

  group('init()', () {
    final themeService = ThemeServiceImpl(themeRepository: mockThemeRepository);

    test('test if the value changed from the default value', () {
      //arrange

      //act

      //assert
    });
  });
}
