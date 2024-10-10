import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i, List<ElmModelNew> elmList) {
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
    // ayah 2
    if (elm.ayahs != null && elm.ayahs!.length > 2)
      TextSpan(text: elm.ayahs![2], style: ayahStyle),
    // text 3
    if (elm.texts != null && elm.texts!.length > 3)
      TextSpan(text: elm.texts![3], style: null),
    // ayah 3
    if (elm.ayahs != null && elm.ayahs!.length > 3)
      TextSpan(text: elm.ayahs![3], style: ayahStyle),
    // text 4
    if (elm.texts != null && elm.texts!.length > 4)
      TextSpan(text: elm.texts![4], style: null),
    // ayah 4
    if (elm.ayahs != null && elm.ayahs!.length > 4)
      TextSpan(text: elm.ayahs![4], style: ayahStyle),
    // text 5
    if (elm.texts != null && elm.texts!.length > 5)
      TextSpan(text: elm.texts![5], style: null),
  ];
}

// List<TextSpan> getPageSixTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayah = AppTheme.customTextStyleHadith();
//   return [
//     TextSpan(text: elmList14[i].text),
//     TextSpan(text: elmList14[i].ayah, style: ayah),
//     TextSpan(text: elmList14[i].text2),
//     TextSpan(text: elmList14[i].ayah2, style: ayah),
//     TextSpan(text: elmList14[i].text3),
//     TextSpan(text: elmList14[i].ayah3, style: ayah),
//     TextSpan(text: elmList14[i].text4),
//     TextSpan(text: elmList14[i].ayah4, style: ayah),
//     TextSpan(text: elmList14[i].text5),
//     TextSpan(text: elmList14[i].ayah5, style: ayah),
//     TextSpan(text: elmList14[i].text6),
//   ];
// }