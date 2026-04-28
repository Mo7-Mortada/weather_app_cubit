import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app1/services/weather_service.dart';
import 'package:weather_app1/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(WeatherService(dio: Dio())),
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (BuildContext context, state) {
          // الحصول على اللون من الكيوبيت بناءً على حالة الطقس الحالية
          MaterialColor themeColor = BlocProvider.of<GetWeatherCubit>(
            context,
          ).getThemeColor();
          return MaterialApp(
            theme: ThemeData(
              useMaterial3: true,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: themeColor
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: themeColor,
                foregroundColor: Colors.white,
                iconTheme: const IconThemeData(color: Colors.white),
                elevation: 0,
                centerTitle: true,
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: HomeView(),
          );
        },
      ),
    );
  }
}
