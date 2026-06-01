import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_28_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_28_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira28Page extends StatelessWidget {
  final int? initialPage;

  const Khatira28Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira28Cubit>(
      createCubit: (_) => Khatira28Cubit(),
      dataList: khatiraList28NewOrder,
      title: "الخاطرة 28",
      initialPage: initialPage,
    );
  }
}
