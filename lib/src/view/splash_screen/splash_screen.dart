import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app/src/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
          milliseconds: 1500), // Set the duration for the fading effect
    );

    // Start the animation
    _animationController.forward();

    // Wait for a few seconds, then navigate to the HomeScreen
    Timer(Duration(milliseconds: 2000), () {
      // After the wait time, start the fade-out animation
      _animationController.reverse().then((value) {
        // After the fade-out animation is complete, navigate to the HomeScreen
        Navigator.pushReplacementNamed(context, Routers.homeView);
      });
    });
  }

  // Navigator.pushReplacementNamed(context, Routers.homeView);
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set your preferred background color
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget? child) {
          return Opacity(
            opacity: _animationController.value<0.1?0.1:_animationController.value,
            child: child,
          );
        },
        child: Image.asset(
            'assets/splash_screen_image.png',fit: BoxFit.fill),
      ),
    );
  }
}
