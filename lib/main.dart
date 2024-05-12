// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
// import 'package:weatherapp/pages/home_screen.dart';

// import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(const MyApp());
// }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return  MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Weather App',
// //       home: FutureBuilder<Position>(
// //         future: _determinePosition(),
// //         builder: (context, snapshort) {
// //           if(snapshort.hasData){
// //             return BlocProvider<WeatherBlocBloc>(
// //           create: (context) => WeatherBlocBloc()..add(FetchWeather()),
// //           child: const HomeScreen(),
// //         );
// //           }
// //           else if (snapshot.hasError) {
// //             // Handle error
// //             return Scaffold(
// //               body: Center(
// //                 child: Text("Error: ${snapshot.error}"),
// //               ),
// //             );
// //           }
// //           else{
// //           return Scaffold(
// //             body: Center(
// //               child: CircularProgressIndicator(),
// //             ),
// //           );
// //         }
// //         },
         
// //       ),
// //     );
// //   }
// // }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Weather App',
//       home: FutureBuilder<Position>(
//         future: _determinePosition(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return BlocProvider<WeatherBlocBloc>(
//               create: (context) => WeatherBlocBloc()..add(
//                 FetchWeather(snapshot.data as Position)),
//               child: const HomeScreen(),
//             );
//           } else if (snapshot.hasError) {
//             // Handle error
//             return Scaffold(
//               body: Center(
//                 child: Text("Error: ${snapshot.error}"),
//               ),
//             );
//           } else {
//             // While waiting for the future to complete
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }



// /// Determine the current position of the device.
// ///
// /// When the location services are not enabled or permissions
// /// are denied the `Future` will return an error.
// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the 
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale 
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }
  
//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately. 
//     return Future.error(
//       'Location permissions are permanently denied, we cannot request permissions.');
//   } 

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherapp/bloc/weather_bloc_bloc.dart';
import 'package:weatherapp/pages/Loading_screen.dart';
import 'package:weatherapp/pages/home_screen.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      home: FutureBuilder<Position>(
        future: _determinePosition(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return BlocProvider<WeatherBlocBloc>(
              create: (context) => WeatherBlocBloc()..add(
                FetchWeather(snapshot.data as Position)),
              child: const HomeScreen(),
            );
          } else if (snapshot.hasError) {
            // Handle error
            return Scaffold(
              body: Center(
                child: Text("Error: ${snapshot.error}"),
              ),
            );
          } else {
            // While waiting for the future to complete
            return LoadingPage();
          }
        },
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled, ask user to enable it
    bool serviceRequested = await Geolocator.openLocationSettings();
    if (!serviceRequested) {
      // User canceled or closed the settings, handle it gracefully
      return Future.error('Location services are disabled.');
    }
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, handle it gracefully
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle it gracefully
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

