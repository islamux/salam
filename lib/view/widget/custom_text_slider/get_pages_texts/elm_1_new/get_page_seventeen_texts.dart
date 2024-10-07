import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSeventeentTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i]; // استخدم elmListPreNew بناءً على السياق

  return [
    // text 1
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),

    //  ayah
    if (elm.ayahs != null && elm.ayahs![0].isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle)
  ];
}

// List<TextSpan> getPageSevnteenTexts(int i) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList[i].text),
//     TextSpan(text: elmList[i].ayah, style: ayah),
//   ];
// }
