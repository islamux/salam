import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i, List<ElmModelNew> elmList) {
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
    // ayah 5
    if (elm.ayahs != null && elm.ayahs!.length > 5)
      TextSpan(text: elm.ayahs![5], style: ayahStyle),

    // text 6
    if (elm.texts != null && elm.texts!.length > 6)
      TextSpan(text: elm.texts![6], style: null),
    // ayah 6
    if (elm.ayahs != null && elm.ayahs!.length > 6)
      TextSpan(text: elm.ayahs![6], style: ayahStyle),

    // text 7
    if (elm.texts != null && elm.texts!.length > 7)
      TextSpan(text: elm.texts![7], style: null),
    // ayah 7
    if (elm.ayahs != null && elm.ayahs!.length > 7)
      TextSpan(text: elm.ayahs![7], style: ayahStyle),

    // text 8
    if (elm.texts != null && elm.texts!.length > 8)
      TextSpan(text: elm.texts![8], style: null),
  ];
}
