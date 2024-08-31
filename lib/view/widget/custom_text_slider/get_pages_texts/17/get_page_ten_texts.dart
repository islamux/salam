import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTenTexts(int i) {
  return [
    TextSpan(text: elmList17[i].elmTextSeventeenTen_1),
    TextSpan(
        text: elmList17[i].ayahHadithSeventeenTen_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}
