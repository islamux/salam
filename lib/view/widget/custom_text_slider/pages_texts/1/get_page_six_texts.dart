import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i) {
  return [
    TextSpan(
        text: elmList[i].ayahHadithOneSix_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList[i].footerOneSix, style: AppTheme.customTextStyleFooter()),
  ];
}
