import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle footer = AppTheme.customTextStyleFooter();
  TextStyle title = AppTheme.customTextStyleTitle();

  return [
    TextSpan(text: elmList11[i].elmTextSevenEleven_1),
    TextSpan(text: elmList11[i].ayahHadithElevenEleven_2, style: ayah),
    TextSpan(text: elmList11[i].elmTextElevenEleven_3),
    TextSpan(text: elmList11[i].footerElevenEleven, style: footer),
  ];
}
