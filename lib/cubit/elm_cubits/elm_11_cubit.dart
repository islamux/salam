import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/which_page_to_share/which_page_to_share_in_elm_eleven.dart';
import 'package:flutter/material.dart';

class Elm11Cubit extends BasePageCubit {
  @override
  List<Text> getShareText(int currentPageIndex, List<ElmModelNew> elmList) {
    return whichPageToShareInEleven(currentPageIndex, elmList);
  }
}
