import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  TextEditingController locationController = TextEditingController();
  // String? enteredLocation;


  //   Widget getWeatherIcon(int code) {
  //   switch (code) {
  //     case 200:
  //     case 201:
  //     case 202:
  //     case 210:
  //     case 211:
  //     case 212:
  //     case 221:
  //     case 230:
  //     case 231:
  //     case 232:
  //       return Image.asset('assets/6.png');
  //     case 300:
  //     case 301:
  //     case 302:
  //     case 310:
  //     case 311:
  //     case 312:
  //     case 313:
  //     case 314:
  //     case 321:
  //       return Image.asset('assets/2.png');
  //     case 500:
  //     case 501:
  //     case 502:
  //     case 503:
  //     case 504:
  //       return Image.asset('assets/3.png');
  //     case 600:
  //     case 601:
  //     case 602:
  //     case 611:
  //     case 612:
  //     case 613:
  //     case 615:
  //     case 616:
  //     case 620:
  //     case 621:
  //     case 622:
  //       return Image.asset('assets/12.png');
  //     case 701:
  //     case 711:
  //     case 721:
  //     case 731:
  //     case 741:
  //     case 751:
  //     case 761:
  //     case 762:
  //     case 771:
  //     case 781:
  //       return Image.asset('assets/5.png');
  //     case 800:
  //       return Image.asset('assets/8.png');
  //     case 801:
  //     case 802:
  //     case 803:
  //     case 804:
  //       return Image.asset('assets/4.png');
  //     default:
  //       return Image.asset('assets/4.png');
  //   }
  // }

  String getGreetings(DateTime currentTime) {
    if (currentTime.hour < 12) {
      return 'Good Morning';
    } else if (currentTime.hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  Widget getWeatherIcon(int code){
    switch (code) {
      case >200 && <300:
      return Image.asset('assets/6.png');
      case >=300 && < 400:
      return Image.asset('assets/2.png');
      case >=500 && < 600:
      return Image.asset('assets/3.png');
      case >=600 && <700:
      return Image.asset('assets/12.png');
      case >=700 && <800:
      return Image.asset('assets/5.png');
      case ==800:
      return Image.asset('assets/8.png');
      case >800 && <=804:
      return Image.asset('assets/4.png');

        
      default:
      return Image.asset('assets/4.png');
    }
  }


  // DateTime now = DateTime.now();
  // String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);


  // Widget getGreetings(String formattedDate){
  //   switch (formattedDate) {
  //     case const (formattedDate < '12pm'):
  //     return "Good Morning";
        
  //       break;
  //     default:
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    double hgt = MediaQuery.of(context).size.height;
    double wdt = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: hgt,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(3, -0.3),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-3, -0.3),
                  child: Container(
                    height: 450,
                    width: 300,
                    decoration: const BoxDecoration(
                        // shape: BoxShape.circle,
                        color: Colors.deepPurple),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 300,
                    width: 600,
                    decoration: const BoxDecoration(color: Color(0xFFFFAB40)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if(state is WeatherBlocSuccess){
                    return SizedBox(
                      width: wdt,
                      height: hgt,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text(
                            '📍 ${state.weather.areaName}',
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Text(
                            'Good Morning',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          getWeatherIcon(state.weather.weatherConditionCode!),
                          // Image.asset(
                          //   'assets/1.png',
                          // ),
                           Center(
                            child: Text(
                              '${state.weather.temperature!.celsius!.round()}°C',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 55,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                           Center(
                            child: Text(
                              state.weather.weatherMain!.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                           Center(
                            child: Text(
                              DateFormat('EEEE dd ,').add_jm().format(state.weather.date!),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/8.png',
                                    scale: 70,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunrise!),
                                        // '5:34am',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/9.png',
                                    scale: 9,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        DateFormat().add_jm().format(state.weather.sunset!),
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Divider(
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/10.png',
                                    scale: 9,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Max',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
        
                                        '${state.weather.tempMax!.celsius!.round().toString()}°C',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/11.png',
                                    scale: 9,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                   Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Temp Min',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        '${state.weather.tempMin!.celsius!.round().toString()}°C',
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    );}
                    else{
                      return Container();
                    }
                  },

                  
                ),
                  // Add TextField for location input
                // Positioned(
                //   bottom: 20,
                //   left: 40,
                //   right: 40,
                //   child: TextField(
                //     controller: locationController,
                //     decoration: const InputDecoration(
                //       hintText: 'Enter Location',
                //       filled: true,
                //       fillColor: Colors.white,
                //       border: OutlineInputBorder(),
                //     ),
                //     onChanged: (value) {
                //       enteredLocation = value;
                //     },
                //   ),
                // ),

                // // Add Button to fetch weather data
                // Positioned(
                //   bottom: 80,
                //   left: 40,
                //   right: 40,
                //   child: TextButton(
                //     onPressed: () {
                //       // Trigger fetching weather data based on entered location
                //       if (enteredLocation != null && enteredLocation!.isNotEmpty) {
                //         // Call a method to fetch weather data based on enteredLocation
                //         // For example: fetchWeatherData(enteredLocation!);
                //         // This method should update the UI with weather information
                //       }
                //     },
                //     style: ButtonStyle(
                //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                //     ),
                //     child: const Text(
                //       'Check Weather',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
