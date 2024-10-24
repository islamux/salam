import 'package:flutter/material.dart';

import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_eight.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_eighteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_eleven.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_fifteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_five.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_four.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_fourteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_nine.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_ninteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_one.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_seven.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_seventeen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_six.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_sixteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_ten.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_therteen.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_three.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_twelve.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_twenty.dart';
import 'package:elm/cubit/pages_cubits/elm_1/get_share_text_two.dart';

List<Text> whichPageToShareInPre(int i, List<ElmModelNew> elmList) {
  switch (i) {
    case 0:
      return getShareTextOne(i, elmList);
    case 1:
      return getShareTextTwo(i, elmList);
    case 2:
      return getShareTextThree(i, elmList);
    case 3:
      return getShareTextFour(i, elmList);

    case 4:
      return getShareTextFive(i, elmList);

    case 5:
      return getShareTextSix(i, elmList);

    case 6:
      return getShareTextSeven(i, elmList);

    case 7:
      return getShareTextEight(i, elmList);

    case 8:
      return getShareTextNine(i, elmList);

    case 9:
      return getShareTextTen(i, elmList);

    case 10:
      return getShareTextEleven(i, elmList);

    case 11:
      return getShareTextTwelve(i, elmList);

    case 12:
      return getShareTextTherteen(i, elmList);

    case 13:
      return getShareTextFourteen(i, elmList);

    case 14:
      return getShareTextFifteen(i, elmList);

    case 15:
      return getShareTextSixteen(i, elmList);

    case 16:
      return getShareTextSeventeen(i, elmList);

    case 17:
      return getShareTextEighteen(i, elmList);

    case 18:
      return getShareTextNinteen(i, elmList);

    case 19:
      return getShareTextTwenty(i, elmList);

    default:
      return [];
  }
}
