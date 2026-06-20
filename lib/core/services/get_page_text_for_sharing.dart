import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_model_order.dart';
import 'package:khatir/core/data/model/enum_order.dart';

List<Text> getPageTextsForSharing(
    int pageIndex, List<KhatiraModelOrder> khatiraList) {
  final khatiraModel = khatiraList[pageIndex];
  final List<Text> sharedTexts = [];

  int titleIndex = 0;
  int subtitleIndex = 0;
  int textIndex = 0;
  int ayahIndex = 0;

  // توليد النصوص على شكل عناصر Text وفق ترتيب order
  for (var orderItem in khatiraModel.order) {
    switch (orderItem) {
      case EnOrder.titles:
        if (khatiraModel.titles != null &&
            titleIndex < khatiraModel.titles!.length) {
          sharedTexts.add(Text(khatiraModel.titles![titleIndex]));
          titleIndex++;
        }
        break;

      case EnOrder.subtitles:
        if (khatiraModel.subtitles != null &&
            subtitleIndex < khatiraModel.subtitles!.length) {
          sharedTexts.add(Text(khatiraModel.subtitles![subtitleIndex]));
          subtitleIndex++;
        }
        break;

      case EnOrder.texts:
        if (khatiraModel.texts != null &&
            textIndex < khatiraModel.texts!.length) {
          sharedTexts.add(Text(khatiraModel.texts![textIndex]));
          textIndex++;
        }
        break;

      case EnOrder.ayahs:
        if (khatiraModel.ayahs != null &&
            ayahIndex < khatiraModel.ayahs!.length) {
          sharedTexts.add(Text(khatiraModel.ayahs![ayahIndex]));
          ayahIndex++;
        }
        break;

      case EnOrder.footer:
        if (khatiraModel.footer != null) {
          sharedTexts.add(Text(khatiraModel.footer!));
        }
        break;
    }
  }

  return sharedTexts;
}
