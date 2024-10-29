import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    // ayah
    //if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
    // ayah
    //if (elm.ayahs != null && elm.ayahs!.length > 1)
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
  ];
}
