import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_seven_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_eight_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_nine_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_ten_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_five_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_four_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_one_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_six_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_three_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_4_new/get_page_two_texts.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_one_texts_order.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/model/elm_model_new_order.dart';

List<TextSpan> whichPageToGetInElm4NewOrder(
    int i, List<ElmModelNewOrder> elmList) {
  return getPageTexts(i, elmList);
}
