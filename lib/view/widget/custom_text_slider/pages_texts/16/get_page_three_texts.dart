import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i) {
  return [
    TextSpan(
        text: elmList16[i].subtitleSixteenThree_1,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_1),
    TextSpan(
        text: elmList16[i].subtitleSixteenThree_2,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_2),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_2,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].subtitleSixteenThree_3,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_3),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_3,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_4),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_4,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_5),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_5,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_6),
    TextSpan(
        text: elmList16[i].subtitleSixteenThree_4,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_6,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList16[i].subtitleSixteenThree_5,
        style: AppTheme.customTextStyleTitle()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_8),
    TextSpan(
        text: elmList16[i].ayhaHadithSixteenThree_7,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(text: elmList16[i].elmTextSixteenThree_9),
    TextSpan(
        text: elmList16[i].footerSixteenThree,
        style: AppTheme.customTextStyleFooter())
  ];
}
