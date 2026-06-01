import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_10_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_10_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira10Page extends StatelessWidget {
  final int? initialPage;

  const Khatira10Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira10Cubit>(
      createCubit: (_) => Khatira10Cubit(),
      dataList: khatiraList10NewOrder,
      title: "الخاطرة 10",
      initialPage: initialPage,
    );
  }
}
