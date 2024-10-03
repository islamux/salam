import 'package:elm/core/data/model/elm_lists/elm_list_pre.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageTexts(int i) {
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmListPre[i];

  List<TextSpan> textSpans = [];

  // Add titles
  if (elm.titles != null) {
    for (String title in elm.titles!) {
      textSpans.add(TextSpan(text: title, style: titleStyle));
    }
  }

  // Add subtitles
  if (elm.subtitles != null) {
    for (String subtitle in elm.subtitles!) {
      textSpans.add(TextSpan(text: subtitle, style: subtitleStyle));
    }
  }

  // Add ayahs and texts
  if (elm.ayahs != null && elm.texts != null) {
    for (int j = 0; j < elm.ayahs!.length; j++) {
      if (elm.ayahs![j] != null) {
        textSpans.add(TextSpan(text: elm.ayahs![j], style: ayahStyle));
      }
      if (j < elm.texts!.length && elm.texts![j] != null) {
        textSpans.add(TextSpan(text: elm.texts![j]));
      }
    }
  }

  // Add remaining texts if there are more texts than ayahs
  if (elm.texts != null) {
    for (int j = elm.ayahs?.length ?? 0; j < elm.texts!.length; j++) {
      if (elm.texts![j] != null) {
        textSpans.add(TextSpan(text: elm.texts![j]));
      }
    }
  }

  return textSpans;
}

// List<TextSpan> whichPageToGetInPre(int i) {
//   return getPageTexts(i);
// }
