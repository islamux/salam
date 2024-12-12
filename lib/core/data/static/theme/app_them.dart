import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static TextStyle customTextStyleFooter = const TextStyle(
    color: AppColor.footer,
    fontWeight: FontWeight.bold,
  );

  static TextStyle customTextStyleHadith = const TextStyle(
    color: AppColor.ayahHadith,
    fontWeight: FontWeight.bold,
  );

  static TextStyle customTextStyleSubtitle = const TextStyle(
    color: AppColor.subtitle,
    fontWeight: FontWeight.bold,
  );
  static TextStyle customTextStyleTitle = const TextStyle(
    color: AppColor.title,
    fontWeight: FontWeight.bold,
  );

  static ThemeData goldenTheme = ThemeData(
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 96.0,
        fontWeight: FontWeight.w400,
        color: AppColor.black,
      ),
      displayMedium: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 60.0,
      ),
      titleLarge: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w400,
        color: AppColor.primaryColorBlack,
      ),
      titleMedium: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
        color: AppColor.primaryColorBlack2,
      ),
    ),
  );
}
