import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import 'package:climate/utilities/constants.dart';

class WeatherModel {
  location l = location();

  Future<dynamic> getCityWeather(String cityName) async {
    Networking networkHelper =
        Networking('https://api.openweathermap.org/data/2'
            '.5/weather?q=$cityName&appid=$kapikey&units=metric');

    var weatherData = await networkHelper.networkData();
    return weatherData;
  }

  Future<dynamic> weatherdata() {
    Networking nw = Networking('https://api.openweathermap.org/data/2'
        '.5/weather?lat=$l.latitude&lon=$l.longitude&appid=$kapikey&units'
        '=metric');
    var weatherdata = nw.networkData();
    return weatherdata;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
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
