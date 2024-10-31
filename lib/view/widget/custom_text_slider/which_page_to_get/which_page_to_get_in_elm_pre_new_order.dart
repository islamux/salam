import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:flutter/material.dart';
import 'package:elm/view/widget/custom_text_slider/get_pages_texts/elm_pre_new_order/get_page_one_texts.dart';

List<TextSpan> whichPageToGetInPrerOrder(
    int i, List<ElmModelNewOrder> elmList) {
  // switch (i) {
  //   case 0:
  return getPageTexts(i, elmList);
}
