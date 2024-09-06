import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6/get_page_three_texts.dart';
import '../get_pages_texts/elm_6/get_page_four_text.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_6/get_page_two_texts.dart';
import 'package:flutter/material.dart';

List<TextSpan> whichPageToGetInElm6(int i) {
  switch (i) {
    case 0:
      return getPageOneTexts(i);
    case 1:
      return getPageTwoTexts(i);
    case 2:
      return getPageThreeTexts(i);
    case 3:
      return getPageFourTexts(i);

    case 13:
    default:
      return [];
  }
}
