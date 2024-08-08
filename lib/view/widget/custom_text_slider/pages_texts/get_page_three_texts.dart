import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
        text: elmList16[i].subtitleThree1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].ayahHadithThree1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree1),
    TextSpan(
        text: elmList16[i].subtitleThree2,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextThree2),
    TextSpan(
        text: elmList16[i].ayahHadithThree2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].subtitleThree3,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextThree3),
    TextSpan(
        text: elmList16[i].ayahHadithThree3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree4),
    TextSpan(
        text: elmList16[i].ayahHadithThree4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree5),
    TextSpan(
        text: elmList16[i].ayahHadithThree5,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree6),
    TextSpan(
        text: elmList16[i].subtitleThree4,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].ayahHadithThree6,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree7),
    TextSpan(
        text: elmList16[i].subtitleThree5,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextThree8),
    TextSpan(
        text: elmList16[i].ayahHadithThree7,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextThree9),
    TextSpan(
        text: elmList16[i].footer3, style: AppTheme.customTextStyleFooter())
  ];
}
