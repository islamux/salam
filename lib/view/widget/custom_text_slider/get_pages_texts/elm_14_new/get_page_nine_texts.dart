import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageNineTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();

  ElmModelNew elm = elmList[i];

  return [
    //title 0
    //if (elm.titles != null && elm.titles!.isNotEmpty)
    TextSpan(text: elm.titles![0], style: titleStyle),
    // ayah 0
    //if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
    TextSpan(text: elm.ayahs![0], style: ayahStyle),

    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
  ];
}
