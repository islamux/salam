import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_18_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_18_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira18Page extends StatelessWidget {
  final int? initialPage;

  const Khatira18Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira18Cubit>(
      createCubit: (_) => Khatira18Cubit(),
      dataList: khatiraList18NewOrder,
      title: "الخاطرة 18  ",
      initialPage: initialPage,
    );
  }
}
