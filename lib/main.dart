import 'package:bloc_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'home_feature/presentation/screens/home_screen.dart';
import 'home_feature/application/bloc/api_request_bloc.dart';

import 'package:bloc_app/injection.dart' as di;
import 'darkmode_feature/application/theme_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await di.sl<ThemeService>().init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => di.sl<ThemeService>(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeService>(
      builder: (context, themeService, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.ligthTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode:
              themeService.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: BlocProvider(
            create: (context) => di.sl<ApiRequestBloc>(),
            child: const MyHomePage(title: 'Advice App'),
          ),
        );
      },
    );
  }
}
