import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../presentation/resources/routes_manager.dart';
import '../presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
      builder: (appContext, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getApplicationTheme(),
          navigatorObservers: [routeObserver],
          initialRoute: _getInitialRoute(),
          onGenerateRoute:
              Platform.isIOS ? RouteGenerator.getIOSRoute : RouteGenerator.getRoute,
        );
      }
    );
  }
}

String? _getInitialRoute() {
  return Routes.homeScreen;
}
