import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_ap/screens/mainscreen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset("assets/splash.json"),
            ),
            const SizedBox(height: 20),
            TextButton.icon(
              style: TextButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  backgroundColor: Colors.lightBlue[50],
                  foregroundColor: Colors.black),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MainScreen(),
                ));
              },
              label: const Text("Get started"),
              icon: const Icon(Icons.navigate_next_outlined),
            )
          ],
        ),
      ),
    );
  }
}
