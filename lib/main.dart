import 'package:bloc_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_feature/home_screen.dart';
import 'home_feature/application/bloc/api_request_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.ligthTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => ApiRequestBloc(),
          child: const MyHomePage(title: 'Bloc App'),
        ),
      ], child: const MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}
