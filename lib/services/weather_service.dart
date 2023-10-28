import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '72dbaacd1fbb4678878113150232810';

  WeatherService({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response respons =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(respons.data);
    return weatherModel;
  }

  Future<WeatherModel> getForcast({required String cityName}) async {
    Response respons =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(respons.data);
    return weatherModel;
  }
}
