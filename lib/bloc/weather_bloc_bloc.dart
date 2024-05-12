import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit)  async{
      // TODO: implement event handler

      emit(WeatherBlocLoading());
      try{
        WeatherFactory wf=WeatherFactory("36252c2b9b0fc7ac5c9d130900611041", 
        language: Language.ENGLISH);
       
        Weather weather=await wf.currentWeatherByLocation(
          event.position.latitude,
          event.position.longitude
          );

        print(weather);
        emit(WeatherBlocSuccess(weather));
      }
      catch (e){
        emit(WeatherBlocFailure());
      }
    });
  }
 }
