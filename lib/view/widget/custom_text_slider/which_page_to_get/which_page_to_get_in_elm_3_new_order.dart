import 'package:elm/view/widget/custom_text_slider/get_pages_texts/get_page_one_texts_order.dart';
import 'package:flutter/material.dart';

import '../../../../core/data/model/elm_model_new_order.dart';

List<TextSpan> whichPageToGetInElm3NewOrder(
    int i, List<ElmModelNewOrder> elmList) {
  return getPageTexts(i, elmList);
}
