import 'package:flutter/material.dart';
import 'package:flutter_world_weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_world_weather/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    dynamic weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpinKitFadingCircle(
        color: Colors.white,
        size: 90.0,
      ),
    );
  }
}
