import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageThreeTexts(int i, List<ElmModelNew> elmList) {
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  ElmModelNew elm = elmList[i];
  return [
    // these orederd by ElmTextDersPre
    TextSpan(text: elm.ayahs![0], style: ayahStyle),
    TextSpan(text: elm.texts![0]),
    TextSpan(text: elm.ayahs![1], style: ayahStyle),
    TextSpan(text: elm.texts![1]),
    TextSpan(text: elm.ayahs![2], style: ayahStyle),
    TextSpan(text: elm.texts![2]),
  ];
}

// FIXME=> Temprory func:  Remove Later

getShareTextTest(int currentPageIndex, List<ElmModelNew> elmList) {
  ElmModelNew text = elmList[currentPageIndex];
  return [
    Text(text.titles![0]),
    Text(text.titles![1]),
    Text(text.titles![2]),
    Text(text.titles![3]),

// Subtitle
    Text(text.subtitles![0]),
    Text(text.subtitles![1]),
    Text(text.subtitles![2]),
    Text(text.subtitles![3]),

// Ayah
    Text(text.ayahs![0]),
    Text(text.ayahs![1]),
    Text(text.ayahs![2]),
    Text(text.ayahs![3]),
    Text(text.ayahs![4]),

// Text
    Text(text.texts![0]),
    Text(text.texts![1]),
    Text(text.texts![2]),
    Text(text.texts![3]),
    Text(text.texts![4]),
    Text(text.texts![5]),
  ];
}
