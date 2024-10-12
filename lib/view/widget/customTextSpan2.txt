import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

List<TextSpan> customTextSpan2(
    List<ElmModelNew> elmList, String titleSubTxtAyahFooter, int i) {
  ElmModelNew elm = elmList[i];
  TextStyle subtitleStyle = AppTheme.customTextStyleSubtitle();
  TextStyle ayahStyle = AppTheme.customTextStyleHadith();
  TextStyle footerStyle = AppTheme.customTextStyleFooter();
  TextStyle titleStyle = AppTheme.customTextStyleTitle();
  List<TextSpan> textSpans = [];

  // اختيار النمط المناسب بناءً على titleSubTxtAyahFooter
  switch (titleSubTxtAyahFooter) {
    case 'titles':
      if (elm.titles != null && elm.titles!.isNotEmpty) {
        textSpans.add(TextSpan(text: elm.titles![i], style: titleStyle));
      }
      break;

    case 'subtitles':
      if (elm.subtitles != null && elm.subtitles!.isNotEmpty) {
        textSpans.add(TextSpan(text: elm.subtitles![i], style: subtitleStyle));
      }
      break;

    case 'texts':
      if (elm.texts != null && elm.texts!.isNotEmpty) {
        textSpans.add(TextSpan(text: elm.texts![i], style: null));
      }
      break;

    case 'ayahs':
      if (elm.ayahs != null && elm.ayahs!.isNotEmpty) {
        textSpans.add(TextSpan(text: elm.ayahs![i], style: ayahStyle));
      }
      break;

    case 'footer':
      if (elm.footer != null && elm.footer!.isNotEmpty) {
        textSpans.add(TextSpan(text: elm.footer!, style: footerStyle));
      }
      break;

    default:
      throw Exception('Invalid titleSubTxtAyahFooter value');
  }

  return textSpans;
}
