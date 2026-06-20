import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_2_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_2_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira2Page extends StatelessWidget {
  final int? initialPage;

  const Khatira2Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira2Cubit>(
      createCubit: (_) => Khatira2Cubit(),
      dataList: khatiraList2NewOrder,
      title: AppStrings.khatiraTitle(2),
      initialPage: initialPage,
    );
  }
}
