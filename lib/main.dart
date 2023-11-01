import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherSatate>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getWeatherColorTheme(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherCondition),
              ),
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getWeatherColorTheme(String? day) {
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
