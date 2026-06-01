import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_23_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_23_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira23Page extends StatelessWidget {
  final int? initialPage;

  const Khatira23Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira23Cubit>(
      createCubit: (_) => Khatira23Cubit(),
      dataList: khatiraList23NewOrder,
      title: "الخاطرة 23  ",
      initialPage: initialPage,
    );
  }
}
