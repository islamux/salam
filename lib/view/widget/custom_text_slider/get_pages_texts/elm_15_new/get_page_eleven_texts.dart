import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageElevenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  return [
// text 0
    //if (elmList[i].texts != null && elmList[i].texts!.isNotEmpty)
    TextSpan(text: elmList[i].texts![0], style: null),
    // ayah 0
    //if (elmList[i].ayahs != null && elmList[i].ayahs!.isNotEmpty)
    TextSpan(text: elmList[i].ayahs![0], style: ayahStyle),
  ];
}
