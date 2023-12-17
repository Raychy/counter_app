import 'dart:convert';

import 'package:counter_app/data/data_provider/weather_data_provider.dart';
import 'package:counter_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository(this.weatherDataProvider);
  Future<WeatherModel> getCurrentWeatherRepository() async {
    try {
      String cityName = 'London';
      final weatherData =
          await weatherDataProvider.getCurrentWeatherDataProvider(cityName);

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromJson(weatherData);
    } catch (e) {
      throw e.toString();
    }
  }
}
