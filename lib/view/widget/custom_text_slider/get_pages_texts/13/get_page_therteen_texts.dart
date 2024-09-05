import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_13.dart';
import 'package:flutter/material.dart';

List<TextSpan> getPageeTherteenTexts(int i) {
  TextStyle ayah = AppTheme.customTextStyleHadith();
  TextStyle title = AppTheme.customTextStyleTitle();
  TextStyle footer = AppTheme.customTextStyleFooter();
  return [
    TextSpan(text: elmList13[i].text),
  ];
}
