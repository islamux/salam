import 'package:elm/core/data/model/elm_lists/elm_list_1.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

// List<TextSpan> getPageEightTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();

//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].ayah, style: ayah),
//     TextSpan(text: elmList[i].text2),
//   ];
// }

List<TextSpan> getPageEightTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();

  // التحقق من وجود النصوص قبل إضافتها لتجنب الأخطاء
  return [
    if (elmList[i].text != null) TextSpan(text: elmList[i].text),
    if (elmList[i].ayah != null) TextSpan(text: elmList[i].ayah, style: ayah),
    if (elmList[i].text2 != null) TextSpan(text: elmList[i].text2),
  ];
}
