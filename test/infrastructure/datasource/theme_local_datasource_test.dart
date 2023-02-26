import 'package:bloc_app/darkmode_feature/infrastructure/datasource/theme_local_datasource.dart';
import 'package:bloc_app/darkmode_feature/infrastructure/execptions/exeptions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'theme_local_datasource_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ThemeLocalDatasource themeLocalDatasource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    themeLocalDatasource =
        ThemeLocalDatasourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getChachedThemeData()', () {
    const testThemeData = true;

    test(
        'should return bool (themeData) if there is one stored in sharedPreferences.',
        () async {
      //arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(
          testThemeData); // could use <any> means that any bool key is allowed

      //act
      final result = await themeLocalDatasource.getChachedThemeData();

      //assert
      verify(mockSharedPreferences.getBool(constChachedThemeMode));
      expect(result, testThemeData);
    });

    test('should return a cached exeption if sharedPreferences cant get value',
        () async {
      //arrange
      when(mockSharedPreferences.getBool(any)).thenReturn(null);
      //act
      final call = themeLocalDatasource.getChachedThemeData;

      //assert
      expect(() => call(), throwsA(const TypeMatcher<CacheExeption>()));
    });
  });

  group('setCacheThemeData()', () {
    const testThemeData = true;
    test('should call shared_preferences to cache them mode', () {
      //arrange
      when(mockSharedPreferences.setBool(any, any))
          .thenAnswer((_) async => true);

      //act
      themeLocalDatasource.setCacheThemeData(mode: testThemeData);

      //assurte
      verify(
          mockSharedPreferences.setBool(constChachedThemeMode, testThemeData));
    });
  });
}
