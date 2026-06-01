import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_3_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_3_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira3Page extends StatelessWidget {
  final int? initialPage;

  const Khatira3Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira3Cubit>(
      createCubit: (_) => Khatira3Cubit(),
      dataList: khatiraList3NewOrder,
      title: "الخاطرة 3",
      initialPage: initialPage,
    );
  }
}
