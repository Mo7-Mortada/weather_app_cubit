import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app1/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = "https://api.openweathermap.org/data/2.5";
  final String apiKey = "0daff1d5bb7cea596d9dffa851091955";

  WeatherService({required this.dio});
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
          final Response response = await dio.get(
      "$baseUrl/weather?q=$cityName&units=metric&appid=$apiKey"
    );
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
      
    } on DioException catch (e) {
      String errMessage ;
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          errMessage = "فشل الاتصال: السيرفر استغرق وقتاً طويلاً للرد";
          break;
        case DioExceptionType.connectionError:
          errMessage = "لا يوجد اتصال بالإنترنت، يرجى التحقق من الشبكة";
          break;
        case DioExceptionType.badResponse:
          errMessage = e.response?.data["message"] ?? "حدث خطأ في الطلب";
          break;
        default:
          errMessage = "عذراً، حدث خطأ غير متوقع";
      }
      throw Exception(errMessage);

    } catch (e) {
      log(e.toString());
      // throw Exception("حدث خطأ ما، حاول لاحقاً");
      throw Exception(e.toString().replaceFirst('Exception: ', ''));
    }
  }
}