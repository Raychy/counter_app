import 'package:counter_app/bloc/weather_bloc.dart';
import 'package:counter_app/data/data_provider/weather_data_provider.dart';
import 'package:counter_app/data/repository/weather_repository.dart';
import 'package:counter_app/pallete.dart';
import 'package:counter_app/presentation/screens/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepository>()),
        // providers: [
        //   BlocProvider(
        //     create: (_) => CounterCubit(),
        //   ),
        //   BlocProvider(
        //     create: (_) => TodoCubit(),
        //   ),
        //   BlocProvider(
        //     create: (_) => CounterBloc(),
        //   ),
        //   BlocProvider(
        //     create: (_) => AuthBloc(),
        //   ),
        //   BlocProvider(
        //     create: (_) => WeatherBloc(context.read<WeatherRepository>()),
        //   ),
        // ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Pallete.backgroundColor,
          ),
          debugShowCheckedModeBanner: false,
          home: const WeatherScreen(),
          // initialRoute: '/',
          // routes: {
          //   '/': (_) => const WeatherScreen(),
          //   '/login': (_) => const LoginScreen(),
          //    '/home': (_) => const HomeScreen(),
          // },
        ),
      ),
    );
  }
}
