import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_29_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_29_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira29Page extends StatelessWidget {
  final int? initialPage;

  const Khatira29Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira29Cubit>(
      createCubit: (_) => Khatira29Cubit(),
      dataList: khatiraList29NewOrder,
      title: "الخاطرة 29",
      initialPage: initialPage,
    );
  }
}
