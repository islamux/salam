import 'package:flutter/material.dart';
import '../get_pages_texts/elm_10/get_page_one_texts.dart';
import '../get_pages_texts/elm_10/get_page_two_texts.dart';
import '../get_pages_texts/elm_10/get_page_three_texts.dart';
import '../get_pages_texts/elm_10/get_page_four_texts.dart';
import '../get_pages_texts/elm_10/get_page_five_texts.dart';
import '../get_pages_texts/elm_10/get_page_six_texts.dart';

List<TextSpan> whichPageToGetInElm10(int i) {
  switch (i) {
    case 0:
      return getPageOneTexts(i);
      print("fix it later ");
    case 1:
      return getPageTwoTexts(i);
    case 2:
      return getPageThreeTexts(i);
    case 3:
      return getPageFourTexts(i);
    case 4:
      return getPageFiveTexts(i);
      print("fix it later ");
    case 5:
      return getPageSixTexts(i);
    default:
      return [];
  }
}
