import 'package:elm/core/data/model/elm_lists/elm_list_18.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/view/widget/custom_text_span.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageEightTexts(int i) {
  ElmModel elm = elmList18[i];
  return [customTextSpan(elm.text, null)];
}
