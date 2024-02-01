import 'package:agent_picker/pages/homepage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const id = "Splash-Screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Center(
        child: Text(
          "Valorant Roulette",
          style: TextStyle(
              fontFamily: "CustomFont", color: Colors.white, fontSize: 30),
        ),
      ),
      nextScreen: HomePage(),
      duration: 1500,
      splashTransition: SplashTransition.fadeTransition,
      centered: true,
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
