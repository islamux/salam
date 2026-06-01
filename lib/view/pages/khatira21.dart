import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_21_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_21_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira21Page extends StatelessWidget {
  final int? initialPage;

  const Khatira21Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira21Cubit>(
      createCubit: (_) => Khatira21Cubit(),
      dataList: khatiraList21NewOrder,
      title: "الخاطرة 21  ",
      initialPage: initialPage,
    );
  }
}
