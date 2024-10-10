import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTherteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق

  return [
    // تحقق من وجود النصوص
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null), // النص الأول
    // تحقق من وجود النصوص
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null), // النص الثاني
    // تحقق من وجود الآيات
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle), // الآية الأولى
  ];
}
// List<TextSpan> getPageTherteenTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].text2),
//     TextSpan(text: elmList[i].ayah, style: ayah),
//   ];
// }