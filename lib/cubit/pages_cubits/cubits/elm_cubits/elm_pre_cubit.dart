import 'package:elm/core/data/model/elm_model_new.dart';
import 'package:elm/cubit/base_cubit/base_page_cubit.dart';
import 'package:flutter/material.dart';

class ElmPreCubit extends BasePageCubit {
  @override
  List<Text> getShareText(int currentPageIndex, List<ElmModelNew> elmList) {
    ElmModelNew text = elmList[currentPageIndex];
    return [
      Text(text.titles![0]),
      Text(text.ayahs![0]),
      Text(text.texts![0]),
    ];
  }
}
