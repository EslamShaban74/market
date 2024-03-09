import 'package:black_market/app/di.dart';
import 'package:black_market/presentation/resources/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle( SystemUiOverlayStyle(
    statusBarColor: ColorManager.primary,
    statusBarBrightness: Brightness.light,
  ));
  Future.wait([
   ScreenUtil.ensureScreenSize(),
    initAppModule()
  ]);
  runApp(const MyApp());
}

