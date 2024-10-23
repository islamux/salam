import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3_new/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3_new/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3_new/get_page_two_texts.dart';

List<TextSpan> whichPageToGetInElm3New(int i, List<ElmModelNew> elmList) {
  switch (i) {
    case 0:
      return getPageOneTexts(i, elmList);
    case 1:
      return getPageTowTexts(i, elmList);
    case 2:
      return getPageThreeTexts(i, elmList);
    default:
      return [];
  }
}