import 'package:flutter/material.dart';
import 'package:elm/controller/font_controller.dart';
class AppTheme2{
  final FontControllerImp fontController = FontControllerImp();

   TextStyle get goldenThemeTextStyle =>  TextStyle(
    fontSize: fontController.fontSize, 
    fontWeight: FontWeight.w300,
    fontFamily: "AmiriQ",
  );
  }