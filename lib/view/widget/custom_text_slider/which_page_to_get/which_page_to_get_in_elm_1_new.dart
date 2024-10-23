import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_seventeen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eighteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eleven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_fifteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_fourteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_nineteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_sixteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_therteen_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_twelve_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_twenty_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_two_texts.dart';
import 'package:flutter/material.dart';

List<TextSpan> whichPageToGetInElm1New(int i, List<ElmModelNew> elmList) {
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
    case 7:
      return getPageEightTexts(i, elmList);
    case 8:
      return getPageNineTexts(i, elmList);
    case 9:
      return getPageTenTexts(i, elmList);
    case 10:
      return getPageElevenTexts(i, elmList);
    case 11:
      return getPageTwelveTexts(i, elmList);
    case 12:
      return getPageTherteenTexts(i, elmList);
    case 13:
      return getPageFourteenTexts(i, elmList);
    case 14:
      return getPageFifteenTexts(i, elmList);
    case 15:
      return getPageSixteenTexts(i, elmList);
    case 16:
      return getPageSeventeentTexts(i, elmList);
    case 17:
      return getPageEighteenTexts(i, elmList);
    case 18:
      return getPageNineteenTexts(i, elmList);
    case 19:
      return getPageTwentyTexts(i, elmList);
    default:
      return [];
  }
}