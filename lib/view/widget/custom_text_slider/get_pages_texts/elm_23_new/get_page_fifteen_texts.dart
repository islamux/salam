import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFifteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModelNew elm = elmList[i];
  return [
    // Form ElmTextTwentyF//ifteen
    // pageF//ifteen
    // title
    //if (elm.titles != null && elm.titles!.isNotEmpty)
    TextSpan(text: elm.titles![0], style: titleStyle),
    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),
    // subtitle
    //if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
    TextSpan(text: elm.subtitles![0], style: subtitleStyle),

    // text 1
    //if (elm.texts != null && elm.texts!.length > 1)
    TextSpan(text: elm.texts![1], style: null),
    // ayah 1
    //if (elm.ayahs != null && elm.ayahs!.length > 1)
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
  ];
}
