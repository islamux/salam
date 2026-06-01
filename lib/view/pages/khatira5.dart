import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_5_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_5_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira5Page extends StatelessWidget {
  final int? initialPage;

  const Khatira5Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira5Cubit>(
      createCubit: (_) => Khatira5Cubit(),
      dataList: khatiraList5NewOrder,
      title: "الخاطرة 5",
      initialPage: initialPage,
    );
  }
}
