import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:flutter/material.dart';

class Elm1Cubit extends BasePageCubit {
  List<Text> getShareText(int currentPageIndex, List<ElmModelNew> elmList) {
    ElmModelNew text = elmList[currentPageIndex];
    return [];
  }
}
