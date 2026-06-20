import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_9_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_9_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira9Page extends StatelessWidget {
  final int? initialPage;

  const Khatira9Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira9Cubit>(
      createCubit: (_) => Khatira9Cubit(),
      dataList: khatiraList9NewOrder,
      title: "الخاطرة 9",
      initialPage: initialPage,
    );
  }
}
