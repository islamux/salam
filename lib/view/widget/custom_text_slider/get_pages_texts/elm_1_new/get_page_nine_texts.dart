import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith(); // نمط الآيات

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق الجديد

  return [
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0]), // النص الأول
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle), // الآية الأولى
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1]), // النص الثاني
  ];
}

// List<TextSpan> getPageNineTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].ayah, style: ayah),
//     TextSpan(text: elmList[i].text2),
//   ];
// }
