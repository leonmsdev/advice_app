import 'package:bloc_app/darkmode_feature/infrastructure/execptions/exeptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String constChachedThemeMode = 'CACHED_THEME_MODE';

abstract class ThemeLocalDatasource {
  Future<bool> getChachedThemeData();

  Future<void> setCacheThemeData({required bool mode});
}

class ThemeLocalDatasourceImpl implements ThemeLocalDatasource {
  late SharedPreferences sharedPreferences;

  ThemeLocalDatasourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getChachedThemeData() {
    final modeBool = sharedPreferences.getBool(constChachedThemeMode);

    if (modeBool != null) {
      return Future.value(modeBool);
    } else {
      throw CacheExeption();
    }
  }

  @override
  Future<void> setCacheThemeData({required bool mode}) {
    return sharedPreferences.setBool(constChachedThemeMode, mode);
  }
}
