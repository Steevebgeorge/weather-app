import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:weather_ap/constants.dart';
import 'package:weather_ap/weathermodel.dart';

class WeatherApi {
  final String baseUrl = "http://api.weatherapi.com/v1/current.json";

  Future<Weathermodel> getweather(String location) async {
    String url = "$baseUrl?key=$apiKey&q=$location";
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
       return Weathermodel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Failed to load weather data: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("error fetching data");
    }
  }
}
