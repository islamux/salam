import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6_new/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6_new/get_page_three_texts.dart';
import '../get_pages_texts/elm_6_new/get_page_four_text.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6_new/get_page_two_texts.dart';
import 'package:flutter/material.dart';
import '../get_pages_texts/elm_6_new/get_page_five_text.dart';

List<TextSpan> whichPageToGetInElm6New(int i, List<ElmModelNew> elmList) {
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
    default:
      return [];
  }
}
