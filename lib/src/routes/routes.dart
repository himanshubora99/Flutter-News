import 'package:flutter/material.dart';
import 'package:news_app/src/view/home_view/home_view.dart';
import 'package:news_app/src/view/splash_screen/splash_screen.dart';

class Routers {
  static const String splashScreen = '/splashScreen';
  static const String homeView = '/homeView';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: splashScreen),
          builder: (BuildContext context) {
            return SplashScreen();
          },
        );
      case homeView:
        return MaterialPageRoute(
          settings: const RouteSettings(name: homeView),
          builder: (BuildContext context) {
            return HomeView();
          },
        );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (BuildContext context) {
      return SplashScreen();
    });
  }
}