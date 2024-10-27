import 'package:flutter/material.dart';

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_eight.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_eleven.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_fifteen.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_five.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_four.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_fourteen.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_nine.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_one.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_seven.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_six.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_sixteen.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_ten.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_therteen.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_three.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_twelve.dart';
import 'package:elm/cubit/share/elm_22/get_share_text_two.dart';

List<Text> whichPageToShareInTwentyTwo(
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

    case 5:
      return getShareTextSix(currentPageIndex, elmList);

    case 6:
      return getShareTextSeven(currentPageIndex, elmList);

    case 7:
      return getShareTextEight(currentPageIndex, elmList);

    case 8:
      return getShareTextNine(currentPageIndex, elmList);

    case 9:
      return getShareTextTen(currentPageIndex, elmList);

    case 10:
      return getShareTextEleven(currentPageIndex, elmList);

    case 11:
      return getShareTextTwelve(currentPageIndex, elmList);

    case 12:
      return getShareTextTherteen(currentPageIndex, elmList);

    case 13:
      return getShareTextFourteen(currentPageIndex, elmList);

    case 14:
      return getShareTextFifteen(currentPageIndex, elmList);

    case 15:
      return getShareTextSixteen(currentPageIndex, elmList);

    default:
      return [];
  }
}
