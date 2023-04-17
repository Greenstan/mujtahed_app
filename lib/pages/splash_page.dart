import 'dart:async';
import 'package:flutter/material.dart';
import './home.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

// import 'package:mujtahed_app/screens/login_screen.dart';

class SplashScreenPage extends StatefulWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  'mujtahidLogo2.png',
                  height: 250,
                  width: 250,
                ),
              ),
            ),
            Container(
              height: 200,
              padding: const EdgeInsets.all(8.0),
              child: SleekCircularSlider(
                min: 0,
                max: 100,
                initialValue: 100,
                appearance: CircularSliderAppearance(
                  size: 80,
                  infoProperties: InfoProperties(
                      mainLabelStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  )),
                  customColors: CustomSliderColors(
                      dotColor: Colors.transparent, progressBarColor: Colors.blue, shadowColor: Colors.white, trackColor: Colors.white),
                  spinnerDuration: 3,
                  animDurationMultiplier: 2,
                  animationEnabled: true,
                  startAngle: 0.0,
                  angleRange: 360,
                ),
              ),
            ),
            const Text(
              'Developed by KCST Students',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
