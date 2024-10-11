import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageSixteenTexts(int i, List<ElmModelNew> elmList) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();

  ElmModelNew elm = elmList[i];

  return [
    // title
    if (elm.titles != null && elm.titles!.isNotEmpty)
      TextSpan(text: elm.titles![0], style: titleStyle),
    // subtitle 0
    if (elm.subtitles != null && elm.subtitles!.isNotEmpty)
      TextSpan(text: elm.subtitles![0], style: subtitleStyle),
    // text 0
    if (elm.texts != null && elm.texts!.isNotEmpty)
      TextSpan(text: elm.texts![0], style: null),
  ];
}
