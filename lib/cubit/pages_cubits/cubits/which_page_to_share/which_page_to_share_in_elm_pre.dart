import 'package:flutter/material.dart';

import '../../../../core/data/model/elm_model_new.dart';
import '../../elm_pre/get_share_text_one.dart';

import '../../elm_pre/get_share_text_three.dart';
import '../../elm_pre/get_share_text_two.dart';

List<Text> whichPageToShareInPre(int i, List<ElmModelNew> elmList) {
  switch (i) {
    case 0:
      return getShareTextOne(i, elmList);
    case 1:
      return getShareTextTwo(i, elmList);
    case 2:
      return getShareTextThree(i, elmList);

    default:
      return [];
  }
}
