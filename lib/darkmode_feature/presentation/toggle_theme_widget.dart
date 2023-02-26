import 'package:bloc_app/darkmode_feature/application/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Provider.of<ThemeService>(context).isDarkModeOn,
      onChanged: (_) {
        Provider.of<ThemeService>(context, listen: false).toggleTheme();
      },
    );
  }
}
