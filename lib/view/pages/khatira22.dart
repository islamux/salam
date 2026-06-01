import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_22_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_22_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira22Page extends StatelessWidget {
  final int? initialPage;

  const Khatira22Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira22Cubit>(
      createCubit: (_) => Khatira22Cubit(),
      dataList: khatiraList22NewOrder,
      title: "الخاطرة 22",
      initialPage: initialPage,
    );
  }
}
