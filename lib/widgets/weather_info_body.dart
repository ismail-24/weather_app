import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weather}) : super(key: key);

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel weatherData =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
          color: getWeatherColorTheme(weatherData.weatherCondition)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherData.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherData.date.hour}:${weatherData.date.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  weatherData.image == null
                      ? 'assets/images/cloudy.png'
                      : 'https:${weatherData.image!}',
                ),
                Text(
                  '${weatherData.temp}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Maxtemp: ${weatherData.maxTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weatherData.minTemp.round()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherData.weatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Color getWeatherColorTheme(String? day) {
  if (day == null) {
    return Colors.blue;
  }
  if (day == "Sunny") {
    return Colors.yellow;
  } else if (day == "Clear" || day == "Partly cloudy") {
    return Colors.lightBlue;
  } else if (day == "Cloudy") {
    return Colors.grey;
  } else if (day == "Overcast") {
    return Colors.grey;
  } else if (day == "Mist") {
    return Colors.blueGrey;
  } else if (day == "Patchy rain possible") {
    return Colors.orange;
  } else if (day == "Patchy snow possible" ||
      day == "Patchy sleet possible" ||
      day == "Patchy freezing drizzle possible") {
    return Colors.blue;
  } else if (day == "Thundery outbreaks possible") {
    return Colors.deepPurple;
  } else if (day == "Blowing snow" || day == "Blizzard") {
    return Colors.blueGrey;
  } else if (day == "Fog" || day == "Freezing fog") {
    return Colors.grey;
  } else if (day == "Patchy light drizzle" ||
      day == "Light drizzle" ||
      day == "Freezing drizzle" ||
      day == "Heavy freezing drizzle") {
    return Colors.blueGrey;
  } else if (day == "Patchy light rain" ||
      day == "Light rain" ||
      day == "Moderate rain at times" ||
      day == "Moderate rain" ||
      day == "Heavy rain at times" ||
      day == "Heavy rain") {
    return Colors.lightBlue;
  } else if (day == "Light freezing rain" ||
      day == "Moderate or heavy freezing rain" ||
      day == "Light sleet" ||
      day == "Moderate or heavy sleet") {
    return Colors.blueGrey;
  } else if (day == "Patchy light snow" ||
      day == "Light snow" ||
      day == "Patchy moderate snow" ||
      day == "Moderate snow" ||
      day == "Patchy heavy snow" ||
      day == "Heavy snow") {
    return Colors.lightBlue;
  } else if (day == "Ice pellets" ||
      day == "Light rain shower" ||
      day == "Moderate or heavy rain shower" ||
      day == "Torrential rain shower" ||
      day == "Light sleet showers" ||
      day == "Moderate or heavy sleet showers" ||
      day == "Light snow showers" ||
      day == "Moderate or heavy snow showers" ||
      day == "Light showers of ice pellets" ||
      day == "Moderate or heavy showers of ice pellets" ||
      day == "Patchy light rain with thunder" ||
      day == "Moderate or heavy rain with thunder" ||
      day == "Patchy light snow with thunder" ||
      day == "Moderate or heavy snow with thunder") {
    return Colors.grey;
  } else {
    return Colors.blue; // Return a default color if "day" value not found
  }
}
