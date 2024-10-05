import 'package:flutter/material.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_3/get_page_two_texts.dart';

List<TextSpan> whichPageToGetInElm3(int i) {
  switch (i) {
    case 0:
      return getPageOneTexts(i);
    case 1:
      return getPageTowTexts(i);
    case 2:
      return getPageThreeTexts(i);
    default:
      return [];
  }
}
