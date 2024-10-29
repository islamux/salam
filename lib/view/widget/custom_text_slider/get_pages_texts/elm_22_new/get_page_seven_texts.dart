import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSevenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  ElmModelNew elm = elmList[i];
  return [
    // Form ElmTextTwentyTwo{} // page 7
    // title
    //if (elm.titles != null && elm.titles!.isNotEmpty)
    TextSpan(text: elm.titles![0], style: titleStyle),
    // ayah 0
    //if (elm.ayahs != null && elm.ayahs!.isNotEmpty)
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    // text 0
    //if (elm.texts != null && elm.texts!.isNotEmpty)
    TextSpan(text: elm.texts![0], style: null),

    // ayah 1
    //if (elm.ayahs != null && elm.ayahs!.length > 1)
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
    // text 1
    //if (elm.texts != null && elm.texts!.length > 1)
    TextSpan(text: elm.texts![1], style: null),
  ];
}
