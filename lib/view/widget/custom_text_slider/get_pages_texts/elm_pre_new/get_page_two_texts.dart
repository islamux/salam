import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';
import '../../../../../core/data/model/elm_model_new.dart';

List<TextSpan> getPageTwoTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

  ElmModelNew elm = elmList[i];
  return [
    TextSpan(text: elm.titles![0], style: titleStyle),
    TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    TextSpan(text: elm.texts![0]),
  ];
}



// List<TextSpan> getPageTwoTexts(int i) {
//   TextStyle titleStyle = AppTheme.customTextStyleTitle();
//   TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
//   ElmModelNew elmPre = elmListPreNew[i];
//   return [
//     TextSpan(text: elmPre.titles![0], style: titleStyle),
//     TextSpan(text: elmPre.subtitles![0], style: subtitleStyle),
//     TextSpan(text: elmPre.texts![0]),
//   ];
// }

