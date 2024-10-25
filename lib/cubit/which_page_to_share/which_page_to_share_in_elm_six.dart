import 'package:flutter/material.dart';

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/share/elm_6/get_share_text_five.dart';
import 'package:elm/cubit/share/elm_6/get_share_text_four.dart';
import 'package:elm/cubit/share/elm_6/get_share_text_one.dart';
import 'package:elm/cubit/share/elm_6/get_share_text_three.dart';
import 'package:elm/cubit/share/elm_6/get_share_text_two.dart';

List<Text> whichPageToShareInSix(
    int currentPageIndex, List<ElmModelNew> elmList) {
  switch (currentPageIndex) {
    case 0:
      return getShareTextOne(currentPageIndex, elmList);
    case 1:
      return getShareTextTwo(currentPageIndex, elmList);
    case 2:
      return getShareTextThree(currentPageIndex, elmList);
    case 3:
      return getShareTextFour(currentPageIndex, elmList);

    case 4:
      return getShareTextFive(currentPageIndex, elmList);

    default:
      return [];
  }
}
