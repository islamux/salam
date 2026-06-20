import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_13_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_13_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira13Page extends StatelessWidget {
  final int? initialPage;

  const Khatira13Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira13Cubit>(
      createCubit: (_) => Khatira13Cubit(),
      dataList: khatiraList13NewOrder,
      title: AppStrings.khatiraTitle(13),
      initialPage: initialPage,
    );
  }
}
