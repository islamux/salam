import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:flutter/material.dart';

import '../get_pages_texts/get_page_one_texts_order.dart';

List<TextSpan> whichPageToGetInElm2NewOrder(
    int i, List<ElmModelNewOrder> elmList) {
  return getPageTexts(i, elmList);
}
