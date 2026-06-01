import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_32_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_32_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira32Page extends StatelessWidget {
  final int? initialPage;

  const Khatira32Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira32Cubit>(
      createCubit: (_) => Khatira32Cubit(),
      dataList: khatiraList32NewOrder,
      title: "الخاطرة 32",
      initialPage: initialPage,
    );
  }
}
