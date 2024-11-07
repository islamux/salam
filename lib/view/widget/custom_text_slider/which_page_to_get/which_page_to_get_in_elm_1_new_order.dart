// import 'package:elm/core/data/model/elm_model_new.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_seventeen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eight_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eighteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_eleven_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_fifteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_five_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_four_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_fourteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_nine_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_nineteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_one_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_seven_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_six_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_sixteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_ten_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_therteen_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_three_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_twelve_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_twenty_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_1_new/get_page_two_texts.dart';
// import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_one_texts_order.dart';
import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:flutter/material.dart';

import '../get_pages_texts/get_page_one_texts_order.dart';

List<TextSpan> whichPageToGetInElm1NewOrder(
    int i, List<ElmModelNewOrder> elmList) {
  return getPageTexts(i, elmList);
}
