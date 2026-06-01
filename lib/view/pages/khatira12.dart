import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_12_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_12_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira12Page extends StatelessWidget {
  final int? initialPage;

  const Khatira12Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira12Cubit>(
      createCubit: (_) => Khatira12Cubit(),
      dataList: khatiraList12NewOrder,
      title: "الخاطرة 12",
      initialPage: initialPage,
    );
  }
}
