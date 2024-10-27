import 'package:flutter/material.dart';

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_eight.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_eighteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_eleven.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_fifteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_five.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_four.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_fourteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_nine.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_ninteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_one.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_seven.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_seventeen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_six.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_sixteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_ten.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therteen.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty_five.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty_four.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty_one.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty_three.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_therty_two.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_three.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twelve.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_eight.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_five.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_four.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_nine.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_one.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_seven.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_six.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_three.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_twenty_two.dart';
import 'package:elm/cubit/share/elm_20/get_share_text_two.dart';

List<Text> whichPageToShareInTwenty(
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

    case 16:
      return getShareTextSeventeen(currentPageIndex, elmList);

    case 17:
      return getShareTextEighteen(currentPageIndex, elmList);

    case 18:
      return getShareTextNinteen(currentPageIndex, elmList);

    case 19:
      return getShareTextTwenty(currentPageIndex, elmList);

    case 20:
      return getShareTextTwentyOne(currentPageIndex, elmList);

    case 21:
      return getShareTextTwentyTwo(currentPageIndex, elmList);

    case 22:
      return getShareTextTwentyThree(currentPageIndex, elmList);

    case 23:
      return getShareTextTwentyFour(currentPageIndex, elmList);

    case 24:
      return getShareTextTwentyFive(currentPageIndex, elmList);

    case 25:
      return getShareTextTwentySix(currentPageIndex, elmList);

    case 26:
      return getShareTextTwentySeven(currentPageIndex, elmList);

    case 27:
      return getShareTextTwentyEight(currentPageIndex, elmList);

    case 28:
      return getShareTextTwentyNine(currentPageIndex, elmList);

    case 29:
      return getShareTextTherty(currentPageIndex, elmList);

    case 30:
      return getShareTextThertyOne(currentPageIndex, elmList);

    case 31:
      return getShareTextThertyTwo(currentPageIndex, elmList);

    case 32:
      return getShareTextThertyThree(currentPageIndex, elmList);

    case 33:
      return getShareTextThertyFour(currentPageIndex, elmList);

    case 34:
      return getShareTextThertyFive(currentPageIndex, elmList);
    default:
      return [];
  }
}
