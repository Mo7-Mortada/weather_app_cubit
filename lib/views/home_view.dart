import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app1/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app1/views/error_view.dart';
import 'package:weather_app1/views/search_view.dart';
import 'package:weather_app1/widgets/no_weather_body.dart';
import 'package:weather_app1/widgets/weather_info_body.dart';
import 'package:weather_app1/widgets/weather_loading_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return SearchView();
                  },
                ),
              );
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadingState) {
            return const WeatherLoadingBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else if (state is WeatherFailureState) {
            // استخدام الويدجت الموحد بناءً على الرسالة
            return _handleErrorStates(state.errorMessage);
          } else {
            return const ErrorView(
              icon: Icons.error_outline,
              message: "عذراً، حدث خطأ غير متوقع، يرجى المحاولة لاحقاً",
            );
          }
        },
      ),
    );
  }

// دالة ذكية لتحديد أي نوع خطأ سنعرض
  Widget _handleErrorStates(String error) {
    final String msg = error.toLowerCase();

    if (msg.contains("city not found") || msg.contains("المدينة غير موجودة")) {
      return const ErrorView(
        icon: Icons.location_city,
        message: "المدينة غير موجودة، يرجى التحقق من الاسم وإعادة المحاولة",
      );
    } 
    
    if (msg.contains("no connection") || msg.contains("الاتصال") || msg.contains("internet")) {
      return const ErrorView(
        icon: Icons.wifi_off,
        message: "مشكلة في الاتصال، يرجى التحقق من الإنترنت وإعادة المحاولة",
      );
    }

    if (msg.contains("timeout") || msg.contains("وقت")) {
      return const ErrorView(
        icon: Icons.timer_off,
        message: "السيرفر استغرق وقتاً طويلاً للرد، يرجى المحاولة لاحقاً",
      );
    }

    if (msg.contains("bad response") || msg.contains("رد غير صالح")) {
      return const ErrorView(
        icon: Icons.error_outline,
        message: "استلمنا رد غير صالح من السيرفر، يرجى المحاولة لاحقاً",
      );
    }

    // الحالة الافتراضية لأي خطأ آخر
    return ErrorView(
      icon: Icons.error_outline,
      message: error,
    );
  }


}


