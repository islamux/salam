import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';
import '../get_pages_texts/elm_10_new/get_page_one_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_two_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_three_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_four_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_five_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_six_texts.dart';
import '../get_pages_texts/elm_10_new/get_page_seven_texts.dart';

List<TextSpan> whichPageToGetInElm10New(int i, List<ElmModelNew> elmList) {
  switch (i) {
    case 0:
      return getPageOneTexts(i, elmList);
    case 1:
      return getPageTwoTexts(i, elmList);
    case 2:
      return getPageThreeTexts(i, elmList);
    case 3:
      return getPageFourTexts(i, elmList);
    case 4:
      return getPageFiveTexts(i, elmList);
    case 5:
      return getPageSixTexts(i, elmList);
    case 6:
      return getPageSevenTexts(i, elmList);

    default:
      return [];
  }
}
