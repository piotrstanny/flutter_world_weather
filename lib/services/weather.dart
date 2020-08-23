import 'package:flutter_world_weather/services/location.dart';
import 'package:flutter_world_weather/services/networking.dart';

const apiKey = '8b0df20c8c430b8a6438b99191799ea1';

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'http://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩\nThunderstorm';
    } else if (condition < 400) {
      return '🌧\nHeavy rain';
    } else if (condition < 600) {
      return '☔️\nShowers';
    } else if (condition < 700) {
      return '☃️\nSnowing';
    } else if (condition < 800) {
      return '🌫\nMist';
    } else if (condition == 800) {
      return '☀/nSun';
    } else if (condition <= 804) {
      return '☁\nClouds';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
