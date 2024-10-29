import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];
  return [
    // text
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
    // ayah
    //if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text2
    //if (elm.texts != null && elm.texts!.length > 1)
    TextSpan(text: elm.texts![1], style: null),
    // ayah2
    //if (elm.ayahs != null && elm.ayahs!.length > 1)
    TextSpan(text: elm.ayahs![1], style: ayahStyle),

    // text3
    //if (elm.texts != null && elm.texts!.length > 2)
    TextSpan(text: elm.texts![2], style: null),
    // ayah3
    //if (elm.ayahs != null && elm.ayahs!.length > 2)
    TextSpan(text: elm.ayahs![2], style: ayahStyle),

    // text4
    //if (elm.texts != null && elm.texts!.length > 3)
    TextSpan(text: elm.texts![3], style: null),
  ];
}
