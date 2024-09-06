import 'package:flutter/material.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_two_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_8/get_page_three_texts.dart';

List<TextSpan> whichPageToGetInElm8(int i) {
  switch (i) {
    case 0:
      return getPageOneTexts(i);
    case 1:
      return getPageTwoTexts(i);
    case 2:
      return getPageThreeTexts(i);
    case 3:
      return getPageFourTexts(i);
    case 4:
      return getPageFiveTexts(i);
    case 5:
      return getPageSixTexts(i);
    case 6:
      return getPageSevenTexts(i);
    default:
      return [];
  }
}