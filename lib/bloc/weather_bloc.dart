import 'package:counter_app/data/repository/weather_repository.dart';
import 'package:counter_app/models/weather_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }
  void _getCurrentWeather(WeatherFetched event, Emitter emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeatherRepository();
     
      emit(WeatherSuccess(weatherModel: weather));
    } catch (err) {
      emit(WeatherFailure(err.toString()));
    }
  }
}
