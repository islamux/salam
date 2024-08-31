import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneTen_1),
    TextSpan(
        text: elmList[i].ayahHadithOneTen_1,
        style: AppTheme.customTextStyleHadith()),
    TextSpan(
        text: elmList[i].footerOneTen, style: AppTheme.customTextStyleFooter()),
  ];
}
