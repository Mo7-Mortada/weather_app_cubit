import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app1/models/weather_model.dart';
import 'package:weather_app1/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  final WeatherService weatherService;
  GetWeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherModel? weatherModel; // نحتفظ بنسخة هنا لاستخراج اللون منها

  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      await Future.delayed(Duration(seconds: 2));
     weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      // نأخذ رسالة الخطأ التي رميناها في الـ Service
    emit(WeatherFailureState(errorMessage: e.toString().replaceFirst('Exception: ', '')));
    }
  }
  // دالة مساعدة لجلب اللون من الموديل
  MaterialColor getThemeColor() {
    if (weatherModel == null) {
      return Colors.blue; // اللون الابتدائي قبل البحث
    }
    return weatherModel!.getThemeColor();
  }
}
