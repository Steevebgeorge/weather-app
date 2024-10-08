import 'package:flutter/material.dart';
import 'package:weather_ap/screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Weather App',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
