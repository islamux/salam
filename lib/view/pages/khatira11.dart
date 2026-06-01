import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_11_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_11_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira11Page extends StatelessWidget {
  final int? initialPage;

  const Khatira11Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira11Cubit>(
      createCubit: (_) => Khatira11Cubit(),
      dataList: khatiraList11NewOrder,
      title: "الخاطرة 11",
      initialPage: initialPage,
    );
  }
}
