import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_14_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_14_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira14Page extends StatelessWidget {
  final int? initialPage;

  const Khatira14Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira14Cubit>(
      createCubit: (_) => Khatira14Cubit(),
      dataList: khatiraList14NewOrder,
      title: AppStrings.khatiraTitle(14),
      initialPage: initialPage,
    );
  }
}
