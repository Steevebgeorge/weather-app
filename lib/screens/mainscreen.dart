import 'package:flutter/material.dart';
import 'package:weather_ap/api.dart';
import 'package:weather_ap/weathermodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        child: Column(
          children: [
            searchwidget(),
          ],
        ),
      ),
    );
  }

  Widget searchwidget() {
    return SearchBar(
      hintText: "Search location",
      onSubmitted: (value) {
        print(value);
        _getweatherdata(value);
      },
    );
  }

  _getweatherdata(String location) async {
   Weathermodel response = await WeatherApi().getweather(location);
   print(response.toJson());
  }
}
