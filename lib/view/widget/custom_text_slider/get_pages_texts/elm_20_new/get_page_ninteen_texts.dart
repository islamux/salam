import 'package:elm/core/data/model/elm_lists/elm_list_20.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNinteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();

  ElmModelNew elm = elmList[i];
  return [
    // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // text
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
    // ayah
    if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
      TextSpan(text: elm.ayahs![0], style: ayahStyle),
  ];
}

// List<TextSpan> getPageNinteenTexts(int i, List<ElmModelNew>elmList) {
//   TextStyle ayahStyle = AppTheme.customTextStyleHadith();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   ElmModel elm = elmList20[i];
//   return [
//     TextSpan(text: elm.title, style: titleStyle),
//     TextSpan(text: elm.text),
//     TextSpan(text: elm.ayah, style: ayahStyle),
//   ];
// }
