import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '72dbaacd1fbb4678878113150232810';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response respons = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(respons.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMesage = e.response?.data['error']['message'] ??
          'oops there was an error, try later';
      throw Exception(errorMesage);
    } catch (e) {
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
}




//  Future<WeatherModel> getForcast({required String cityName}) async {
//     Response respons =
//         await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

//     WeatherModel weatherModel = WeatherModel.fromJson(respons.data);
//     return weatherModel;
//   }