import 'package:weather_app/models/weather_model.dart';

class WeatherSatate {}

class WeatherInitialState extends WeatherSatate {}

class WeatherLoadedState extends WeatherSatate {
  final WeatherModel weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends WeatherSatate {
  final String errorMessage;

  WeatherFailureState(this.errorMessage);
}
