import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_ap/api.dart';
import 'package:weather_ap/weathermodel.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Weathermodel? response;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchWidget(),
              if (isLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                userContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget userContent() {
    if (response == null) {
      return Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            const Text(
              "Enter your location",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 150),
            Center(
              child: Lottie.asset("assets/search.json", width: 280),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Text(
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                response?.location.name ?? "",
                style: GoogleFonts.abyssinicaSil(
                  fontSize: 45,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${response?.location.region ?? ""}, ",
                    style: GoogleFonts.abyssinicaSil(fontSize: 25)),
                Text(response?.location.country ?? "",
                    style: GoogleFonts.abyssinicaSil(fontSize: 25)),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              response?.current.condition.text ?? "",
              style: GoogleFonts.abyssinicaSil(
                fontSize: 25,
              ),
            ),
            Text("${response?.current.tempC.toString()} °C",
                style: GoogleFonts.abyssinicaSil(fontSize: 45)),
            SizedBox(
              height: 280,
              child: weatherIcon(
                code: response?.current.condition.code.toInt(),
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Humidity",
                        style: GoogleFonts.abyssinicaSil(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        response!.current.windKph.toString(),
                        style: GoogleFonts.abyssinicaSil(fontSize: 20),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Column(
                    children: [
                      Text(
                        "Wind speed",
                        style: GoogleFonts.abyssinicaSil(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${response!.current.windKph.toString()} kph",
                        style: GoogleFonts.abyssinicaSil(fontSize: 20),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
  }

  Widget weatherIcon({int? code}) {
    switch (code) {
      case 1000:
        return Lottie.asset('assets/sunny.json');
      case 1003:
        return Lottie.asset('assets/sunny2.json');
      case 1006:
        return Lottie.asset('assets/cloudy.json');
      case 1009:
        return Lottie.asset('assets/cloudy.json');
      case 1030:
        return Lottie.asset('assets/mist.json');
      case 1063:
        return Lottie.asset('assets/rain.json');
      case 1066:
        return Lottie.asset('assets/rain.json');
      case 1069:
        return Lottie.asset('assets/rain.json');
      case 1072:
        return Lottie.asset('assets/drizzle.json');
      case 1087:
        return Lottie.asset('assets/thunder.json');
      case 1114:
        return Lottie.asset('assets/snow.json');
      case 1117:
        return Lottie.asset('assets/snow.json');
      case 1135:
        return Lottie.asset('assets/fog.json');
      case 1147:
        return Lottie.asset('assets/fog.json');

      default:
        return Lottie.asset('assets/thunder.json');
    }
  }

  Widget searchWidget() {
    return SearchBar(
      hintText: "Search location",
      onSubmitted: (value) {
        _getWeatherData(value);
      },
    );
  }

  Future<void> _getWeatherData(String location) async {
    setState(() {
      isLoading = true;
    });
    try {
      response = await WeatherApi().getweather(location);
    } catch (e) {
      print("Error fetching weather data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
    print(response);
  }
}
