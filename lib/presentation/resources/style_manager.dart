import 'package:flutter/material.dart';

import 'font_manager.dart';

/// App text style manager
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color, String fontFamily){
  return TextStyle(fontSize: fontSize,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color);
}

TextStyle getRegularStyle({double fontSize = FontSize.s12,String fontFamily = FontConstants.somarSansFontFamily ,required Color color}) => _getTextStyle(fontSize, FontWeightManager.regular, color, fontFamily);

TextStyle getMediumStyle({double fontSize = FontSize.s12, String fontFamily = FontConstants.somarSansFontFamily ,required Color color}) => _getTextStyle(fontSize,FontWeightManager.regular,color,fontFamily);

TextStyle getLightStyle({double fontSize = FontSize.s12,String fontFamily = FontConstants.somarSansFontFamily , required Color color}) => _getTextStyle(fontSize, FontWeightManager.light, color,fontFamily);

TextStyle getBoldStyle({double fontSize = FontSize.s12, String fontFamily = FontConstants.somarSansFontFamily ,required Color color}) => _getTextStyle(fontSize, FontWeightManager.bold, color,fontFamily);
