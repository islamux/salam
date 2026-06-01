import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_31_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_31_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class Khatira31Page extends StatelessWidget {
  final int? initialPage;

  const Khatira31Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira31Cubit>(
      createCubit: (_) => Khatira31Cubit(),
      dataList: khatiraList31NewOrder,
      title: "الخاطرة 31",
      initialPage: initialPage,
    );
  }
}
