import 'package:flutter/material.dart';
import 'package:flutter_world_weather/services/location.dart';
import 'package:flutter_world_weather/services/networking.dart';
import 'package:flutter_world_weather/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '8b0df20c8c430b8a6438b99191799ea1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print('init state happened');
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();

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
