import 'package:elm/controller/font_controller.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  //static final FontControllerImp fontController = Get.put(FontControllerImp());
  static final FontControllerImp fontController = Get.put(FontControllerImp());

  //static final List<String> fontList = ['Amiri', 'Cairo', 'Kawkab','Tajawal'];

  static ThemeData goldenTheme = ThemeData(
    //fontFamily: 'Amiri',
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      displayMedium: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 60.0,
      ),
      titleLarge: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: AppColor.primaryColorBlack,
      ),
      titleMedium: const TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColorBlack2,
      ),
      bodyLarge: TextStyle(
        fontSize: fontController.fontSize,
        color: AppColor.black,
      ),
      bodyMedium: TextStyle(
        fontSize: fontController.fontSize,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: fontController.fontSize,
      ),
    ),
  );
}
