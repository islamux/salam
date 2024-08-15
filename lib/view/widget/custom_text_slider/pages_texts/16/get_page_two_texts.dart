import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTowTexts(int i) {
  return [
    TextSpan(text: elmList16[i].elmTextSixteenTwo_1),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenTwo_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenTwo_2),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenTwo_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenTwo_3),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenTwo_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].subtitleSixteenTwo_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenTwo_4),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenTwo_4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenTwo_5),
    TextSpan(
        text: elmList16[i].footerSixteenTwo,
        style: AppTheme.customTextStyleFooter()),
  ];
}
