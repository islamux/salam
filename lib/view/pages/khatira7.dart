import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_7_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_7_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira7Page extends StatelessWidget {
  final int? initialPage;

  const Khatira7Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira7Cubit>(
      createCubit: (_) => Khatira7Cubit(),
      dataList: khatiraList7NewOrder,
      title: AppStrings.khatiraTitle(7),
      initialPage: initialPage,
    );
  }
}
