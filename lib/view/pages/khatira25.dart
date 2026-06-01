import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_25_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_25_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira25Page extends StatelessWidget {
  final int? initialPage;

  const Khatira25Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira25Cubit>(
      createCubit: (_) => Khatira25Cubit(),
      dataList: khatiraList25NewOrder,
      title: "الخاطرة 25 ",
      initialPage: initialPage,
    );
  }
}
