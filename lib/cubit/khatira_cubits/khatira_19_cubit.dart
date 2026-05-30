import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/cubit/base_cubit/base_page_cubit.dart';
import 'package:khatir/cubit/share/get_page_text_for_sharing.dart';
import 'package:flutter/material.dart';

class Khatira19Cubit extends BasePageCubit {
  @override
  List<Text> getShareText(
      int currentPageIndex, List<KhatiraModelNewOrder> khatiraList) {
    return getPageTextsForSharing(currentPageIndex, khatiraList);
  }
}
