import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList13[i].elmTextTherteenSeven_1),
    TextSpan(text: elmList13[i].ayahHadithTherteenSeven_1, style: ayah),
    TextSpan(text: elmList13[i].elmTextTherteenSeven_2),
    TextSpan(text: elmList13[i].ayahHadithTherteenSeven_2, style: ayah),
    TextSpan(text: elmList13[i].footerTherteenSeven, style: footer)
  ];
}
