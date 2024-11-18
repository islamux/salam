import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:elm/cubit/share/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';

class Elm14Cubit extends BasePageCubit {
  @override
  List<Text> getShareText(
      int currentPageIndex, List<ElmModelNewOrder> elmList) {
    return getPageTextsForSharing(currentPageIndex, elmList);
  }
}
