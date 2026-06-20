import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_1_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_1_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira1Page extends StatelessWidget {
  final int? initialPage;

  const Khatira1Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira1Cubit>(
      createCubit: (_) => Khatira1Cubit(),
      dataList: khatiraList1NewOrder,
      title: "الخاطرة 1",
      initialPage: initialPage,
    );
  }
}
