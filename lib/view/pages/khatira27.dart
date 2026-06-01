import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_27_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_27_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira27Page extends StatelessWidget {
  final int? initialPage;

  const Khatira27Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira27Cubit>(
      createCubit: (_) => Khatira27Cubit(),
      dataList: khatiraList27NewOrder,
      title: "الخاطرة 27 ",
      initialPage: initialPage,
    );
  }
}
