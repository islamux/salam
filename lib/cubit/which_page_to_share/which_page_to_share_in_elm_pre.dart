import 'package:flutter/material.dart';

import '../../../core/data/model/elm_model_new.dart';
import '../share/elm_pre/get_share_text_one.dart';

import '../share/elm_pre/get_share_text_three.dart';
import '../share/elm_pre/get_share_text_two.dart';

List<Text> whichPageToShareInPre(
    int currentPageIndex, List<ElmModelNew> elmList) {
  switch (currentPageIndex) {
    case 0:
      return getShareTextOne(currentPageIndex, elmList);
    case 1:
      return getShareTextTwo(currentPageIndex, elmList);
    case 2:
      return getShareTextThree(currentPageIndex, elmList);

    default:
      return [];
  }
}
