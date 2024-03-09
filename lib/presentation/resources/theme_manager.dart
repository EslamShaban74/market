
import 'package:black_market/presentation/resources/colors_manager.dart';
import 'package:black_market/presentation/resources/style_manager.dart';
import 'package:black_market/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'font_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.primaryDark,
      disabledColor: ColorManager.grey,
      splashColor: ColorManager.lightPrimary, // ripple effect color
      scaffoldBackgroundColor: ColorManager.white,
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.s4
      ),

      appBarTheme: AppBarTheme(
        color: ColorManager.primary,
        centerTitle: true,
        elevation: AppSize.s4,
        shadowColor: ColorManager.lightPrimary,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white),
      ),
      switchTheme:SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ColorManager.primary;
            }
            return ColorManager.white;
          },
        ),
        trackColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return ColorManager.lightPrimary;
            }
            return ColorManager.drawerGrey;
          },
        ),
      ),
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              textStyle: getRegularStyle(color: Colors.white, fontSize: FontSize.s16.sp), backgroundColor: ColorManager.primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSize.s4)
              )
          )
      ),

      textTheme: TextTheme(
          displayLarge: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16.sp),
          headlineLarge: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s16.sp),
          headlineMedium: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s14.sp),
          titleSmall: getRegularStyle(color: ColorManager.black, fontSize: FontSize.s12.sp),
          titleMedium: getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s16.sp),
          titleLarge: getBoldStyle(color: Colors.black, fontSize: FontSize.s16.sp),
          bodyMedium: getRegularStyle(color: Colors.black, fontSize: FontSize.s16.sp),
          bodyLarge: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14),
          bodySmall: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s12.sp)
      ),

      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p10.w,vertical: AppPadding.p14.h),
        hintStyle: getLightStyle(color: Colors.black, fontSize: FontSize.s14.sp),
        labelStyle: getMediumStyle(color: Colors.red, fontSize: FontSize.s14.sp),
        errorStyle: getRegularStyle(color: ColorManager.red, fontSize: FontSize.s14.sp),
        fillColor: ColorManager.grey,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20.r),
          borderSide: BorderSide.none,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20.r),
          borderSide: BorderSide.none,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20.r),
          borderSide: BorderSide(color: ColorManager.red),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20.r),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s20.r),
          borderSide: BorderSide.none,
        ),
      ),

      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorManager.lightPrimary
      )
  );
}