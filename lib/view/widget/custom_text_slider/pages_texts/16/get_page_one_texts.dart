import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageOneTexts(int i) {
  return [
    // Page 1 : titles, subtitles, texts, ayahHadiths, footer
    TextSpan(
        text: elmList16[i].titleSixteenOne,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].subtitleSixteenOne_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenOne_1),
    TextSpan(
      text: elmList16[i].ayhaHadithSixteenOne_1,
      style: AppTheme.customTextStyleHadith(),
    ),
    TextSpan(text: elmList16[i].elmTextSixteenOne_2),
    TextSpan(
        text: elmList16[i].subtitleSixteenOne_2,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenOne_3),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenTwo_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenOne_4),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenOne_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenOne_5),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenOne_4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenOne_6),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenOne_5,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].footerSixteenOne,
        style: AppTheme.customTextStyleFooter()),
  ];
}
