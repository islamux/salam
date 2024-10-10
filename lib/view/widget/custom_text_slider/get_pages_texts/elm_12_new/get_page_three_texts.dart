import 'package:elm/core/data/model/elm_lists/elm_list_12.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // ayah 0
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 1
    if (elm.texts != null && elm.texts!.length > 1)
      TextSpan(text: elm.texts![1], style: null),
    // ayah 1
    if (elm.ayahs != null && elm.ayahs!.length > 1)
      TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // text 2
    if (elm.texts != null && elm.texts!.length > 2)
      TextSpan(text: elm.texts![2], style: null),
  ];
}

// List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();

//   ElmModelNew elm = elmList[i];

//   return [
//     TextSpan(text: elmList12[i].text, style: ayah),
//     TextSpan(text: elmList12[i].ayah, style: ayah),
//     TextSpan(text: elmList12[i].text2),
//     TextSpan(text: elmList12[i].ayah3, style: ayah),
//     TextSpan(text: elmList12[i].text3),
//   ];
// }
