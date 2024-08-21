import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevnteenTexts(int i) {
  return [
    TextSpan(text: elmList[i].elmTextOneSeventeen_1),
    TextSpan(
        text: elmList[i].ayahHadithOneSeventeen_1,
        style: AppTheme.customTextStyleHadith()),
  ];
}
