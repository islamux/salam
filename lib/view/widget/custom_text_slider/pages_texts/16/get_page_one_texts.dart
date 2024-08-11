import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(
        text: elmList16[i].titleOne, style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].subtitleOne1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextOne1),
    TextSpan(
      text: elmList16[i].ayahHadithOne,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList16[i].elmTextOne2),
    TextSpan(
        text: elmList16[i].subtitleOne2,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextOne3),
    TextSpan(
        text: elmList16[i].ayahHadithOne2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextOne4),
    TextSpan(
        text: elmList16[i].ayahHadithOne3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextOne5),
    TextSpan(
        text: elmList16[i].ayahHadithOne4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextOne6),
    TextSpan(
        text: elmList16[i].ayahHadithOne5,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].footerOne, style: AppTheme.customTextStyleFooter()),
  ];
}
