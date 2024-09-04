import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();

  return [
    TextSpan(text: elmList12[i].elmTextTwelveSeven_1),
    TextSpan(text: elmList12[i].ayahHadithTwelveSeven_1, style: ayah),
    TextSpan(text: elmList12[i].foooterTwelveSeven, style: footer),
  ];
}
