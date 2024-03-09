import 'package:black_market/app/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/home_screen/view/home_screen.dart';

class Routes {
  static const String homeScreen = "/homeScreen";
}

class RouteGenerator {
  ///Android routes
  static Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }

  ///Ios routes
  static Route<dynamic>? getIOSRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        initHomeModule();
        return CupertinoPageRoute(builder: (_) => HomeScreen());
      default:
        return null;
    }
  }
}
