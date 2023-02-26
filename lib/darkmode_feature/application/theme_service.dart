import 'package:bloc_app/darkmode_feature/infrastructure/repositories/theme_local_repository_impl.dart';
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
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> setTheme({required bool mode}) {
    // TODO: implement setTheme
    throw UnimplementedError();
  }

  @override
  Future<void> toggleTheme() {
    // TODO: implement toggleTheme
    throw UnimplementedError();
  }
}
