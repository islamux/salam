import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(text: elmList16[i].elmTextTwo1),
    TextSpan(
        text: elmList16[i].ayahHadithTwo1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextTwo2),
    TextSpan(
        text: elmList16[i].ayahHadithTwo2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextTwo3),
    TextSpan(
        text: elmList16[i].ayahHadithTwo3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].subtitleTwo1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextTwo4),
    TextSpan(
        text: elmList16[i].ayahHadithTwo4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextTwo5),
    TextSpan(
        text: elmList16[i].footerTwo, style: AppTheme.customTextStyleFooter()),
  ];
}
