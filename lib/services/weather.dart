class WeatherModel {
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
      return '☀/nSunny️';
    } else if (condition <= 804) {
      return '☁\nCloudy️';
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
