import 'package:flutter/material.dart';
import 'package:flutter_world_weather/services/location.dart';
import 'package:flutter_world_weather/services/networking.dart';

const apiKey = '8b0df20c8c430b8a6438b99191799ea1';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double longitude, latitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    Location location = Location();
    await location.getCurrLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your position is:'),
      ),
    );
  }
}
