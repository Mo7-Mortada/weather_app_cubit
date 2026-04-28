import 'package:flutter/material.dart';

class WeatherModel {
  final String cityName;
  final String countryName;
  final String? icon;
  final double avgTemp;
  final double minTemp;
  final double maxTemp;
  final int updatedAt;
  final String weatherStatus;

  WeatherModel({
    required this.cityName,
    required this.countryName,
    this.icon,
    required this.avgTemp,
    required this.minTemp,
    required this.maxTemp,
    required this.weatherStatus,
    required this.updatedAt
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json["name"],
      countryName: json["sys"]["country"],
      avgTemp: json["main"]["temp"],
      minTemp: json["main"]["temp_min"],
      maxTemp: json["main"]["temp_max"],
      weatherStatus: json["weather"][0]["main"],
      icon: json["weather"][0]["icon"],
      updatedAt: json["dt"]
    );
  }

  // دالة لتحديد اللون بناءً على الحالة
  MaterialColor getThemeColor() {
    switch (weatherStatus.toLowerCase()) {
      case 'clear':
      case 'sunny':
        return Colors.orange;
      case 'clouds':
      case 'mist':
      case 'fog':
        return Colors.blueGrey;
      case 'rain':
      case 'drizzle':
      case 'shower rain':
        return Colors.blue;
      case 'thunderstorm':
        return Colors.deepPurple;
      case 'snow':
        return Colors.lightBlue;
      default:
        return Colors.blue; // اللون الافتراضي
    }
  }


}
