import 'package:flutter/foundation.dart';

import '../domain/repositories/theme_local_repository.dart';

abstract class ThemeService extends ChangeNotifier {
  late bool isDarkModeOn;

  Future<void> toggleTheme();
  Future<void> setTheme({required bool mode});
  Future<void> init();
}

class ThemeServiceImpl extends ChangeNotifier implements ThemeService {
  final ThemeRepository themeRepository;

  ThemeServiceImpl({required this.themeRepository});

  @override
  bool isDarkModeOn = true;

  @override
  Future<void> init() async {
    final modeOrFailure = await themeRepository.getThemeMode();

    modeOrFailure.fold((failure) {
      setTheme(mode: true);
    }, (mode) {
      setTheme(mode: mode);
    });
  }

  @override
  Future<void> setTheme({required bool mode}) async {
    isDarkModeOn = mode;
    notifyListeners();
    await themeRepository.setThemeMode(mode: isDarkModeOn);
  }

  @override
  Future<void> toggleTheme() async {
    isDarkModeOn = !isDarkModeOn; //negate the value
    await setTheme(mode: isDarkModeOn);
  }
}
