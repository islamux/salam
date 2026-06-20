import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_8_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_8_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira8Page extends StatelessWidget {
  final int? initialPage;

  const Khatira8Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira8Cubit>(
      createCubit: (_) => Khatira8Cubit(),
      dataList: khatiraList8NewOrder,
      title: "الخاطرة 8",
      initialPage: initialPage,
    );
  }
}
