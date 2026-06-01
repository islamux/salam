import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_15_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_15_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira15Page extends StatelessWidget {
  final int? initialPage;

  const Khatira15Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira15Cubit>(
      createCubit: (_) => Khatira15Cubit(),
      dataList: khatiraList15NewOrder,
      title: "الخاطرة 15  ",
      initialPage: initialPage,
    );
  }
}
