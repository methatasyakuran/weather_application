import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/location.dart';

class WeatherService {
  late double temp;
  late String temperature;
  late String weatherIcon;
  late String cityName;

  static const API_KEY = 'f52ab890de4ab72bff25fb9b64404f37';

  Future<WeatherService> getWeatherData() async {
    LocationService locationService = LocationService();
    await locationService.getCurrentLocation();

    double lat = locationService.latitude;
    double lon = locationService.longitude;

    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY'));
    if (response.statusCode == 200) {
      String data = response.body;
      var weatherData = jsonDecode(data);

      print('weatherData: $weatherData');
      temp = weatherData['main']['temp'] - 273.15;
      temperature = temp.toStringAsFixed(2);
      weatherIcon = weatherData['weather'][0]['icon'];
      cityName = weatherData['name'];
    }
    return this;
  }
}