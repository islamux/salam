import 'package:elm/core/data/model/elm_lists/elm_list_18.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageFiveTexts(int i, List<ElmModelNew> elmList) {
  ElmModel elm = elmList18[i];

  return [
    TextSpan(text: elm.text),
  ];
}
