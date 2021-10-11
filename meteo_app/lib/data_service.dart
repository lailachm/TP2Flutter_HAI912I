import 'dart:convert';

import 'package:meteo_app/models.dart';
import 'package:http/http.dart' as http;

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    // api.openweathermap.org/data/2.5/forecast?q={city name}&appid={API key}

    final queryParameters = {
      'q': city,
      'appid': '29b75aa7c624bd47f0fe5fc187759477',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/forecast', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}