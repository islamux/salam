import 'package:flutter/material.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';

List<Text> getPageTextsForSharing(
    int pageIndex, List<ElmModelNewOrder> elmList) {
  final elm = elmList[pageIndex];
  final List<Text> sharedTexts = [];

  int titleIndex = 0;
  int subtitleIndex = 0;
  int textIndex = 0;
  int ayahIndex = 0;

  // توليد النصوص على شكل عناصر Text وفق ترتيب order
  for (var orderItem in elm.order) {
    switch (orderItem) {
      case EnOrder.titles:
        if (elm.titles != null && titleIndex < elm.titles!.length) {
          sharedTexts.add(Text(elm.titles![titleIndex]));
          titleIndex++;
        }
        break;

      case EnOrder.subtitles:
        if (elm.subtitles != null && subtitleIndex < elm.subtitles!.length) {
          sharedTexts.add(Text(elm.subtitles![subtitleIndex]));
          subtitleIndex++;
        }
        break;

      case EnOrder.texts:
        if (elm.texts != null && textIndex < elm.texts!.length) {
          sharedTexts.add(Text(elm.texts![textIndex]));
          textIndex++;
        }
        break;

      case EnOrder.ayahs:
        if (elm.ayahs != null && ayahIndex < elm.ayahs!.length) {
          sharedTexts.add(Text(elm.ayahs![ayahIndex]));
          ayahIndex++;
        }
        break;

      case EnOrder.footer:
        if (elm.footer != null) {
          sharedTexts.add(Text(elm.footer!));
        }
        break;
    }
  }

  return sharedTexts;
}

