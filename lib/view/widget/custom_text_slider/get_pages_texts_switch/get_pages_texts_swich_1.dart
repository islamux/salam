import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eighteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_eleven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_fifteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_fourteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_nineteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_seventeen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_sixteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_therteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_twelve_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_twenty_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/1/get_page_two_texts.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPagesTextSwich(int i) {
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
    case 7:
      return getPageEightTexts(i);
    case 8:
      return getPageNineTexts(i);
    case 9:
      return getPageTenTexts(i);
    case 10:
      return getPageElevenTexts(i);
    case 11:
      return getPageTwelveTexts(i);
    case 12:
      return getPageTherteenTexts(i);
    case 13:
      return getPageFourteenTexts(i);
    case 14:
      return getPageFifteenTexts(i);
    case 15:
      return getPageSixteenTexts(i);
    case 16:
      return getPageSevnteenTexts(i);
    case 17:
      return getPageEighteenTexts(i);
    case 18:
      return getPageNineteenTexts(i);
    case 19:
      return getPageTwentyTexts(i);
    default:
      return [];
  }
}
