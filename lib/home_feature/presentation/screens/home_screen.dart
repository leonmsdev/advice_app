import 'package:bloc_app/darkmode_feature/presentation/toggle_theme_widget.dart';
import 'package:bloc_app/home_feature/application/bloc/api_request_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: const [ThemeSwitch()],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please trigger the button to repeat your request',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ApiRequestBloc, ApiRequestState>(
                bloc: BlocProvider.of<ApiRequestBloc>(context),
                builder: (context, state) {
                  if (state is ApiRequestInitial) {
                    return Text(
                      'Hello World! Initial State',
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  } else if (state is ApiRequestLoading) {
                    return const CircularProgressIndicator();
                  } else if (state is ApiRequestLoaded) {
                    return Text(state.advice,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall);
                  } else if (state is ApiRequestError) {
                    return Text(state.error);
                  } else {
                    return const Placeholder();
                  }
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ApiRequestBloc>(context).add(ApiRequestedEvent());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.repeat),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
