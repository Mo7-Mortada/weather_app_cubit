import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app1/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  final imageWeatherUrl = "https://openweathermap.org/payload/api/media/file/";

  @override
  Widget build(BuildContext context) {
    var wetherModel = weather;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weather.getThemeColor(),
            weather.getThemeColor()[300]!,
            weather.getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            wetherModel.cityName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          Text(
            'updated at ${DateFormat('hh:mm a').format(DateTime.fromMillisecondsSinceEpoch(wetherModel.updatedAt * 1000))}, ${DateTime.now().difference(DateTime.fromMillisecondsSinceEpoch(wetherModel.updatedAt * 1000)).inMinutes} min ago',
            style: TextStyle(fontSize: 20, color: Colors.grey[600]),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "$imageWeatherUrl${wetherModel.icon}.png",
                width: 100,
                height: 100,
                errorBuilder: (context, error, stackTrace) {
                  log('Error loading weather icon: $error');
                  return Container();
                },
              ),
              Text(
                '${wetherModel.avgTemp.toStringAsFixed(0)}°C',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
              ),
              Column(
                children: [
                  Text(
                    'Max temp: ${wetherModel.maxTemp.toStringAsFixed(0)}°C',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    'Min temp: ${wetherModel.minTemp.toStringAsFixed(0)}°C',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            wetherModel.weatherStatus,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ],
      ),
    );
  }
}
