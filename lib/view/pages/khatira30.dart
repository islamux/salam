import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_30_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_30_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira30Page extends StatelessWidget {
  final int? initialPage;

  const Khatira30Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira30Cubit>(
      createCubit: (_) => Khatira30Cubit(),
      dataList: khatiraList30NewOrder,
      title: AppStrings.khatiraTitle(30),
      initialPage: initialPage,
    );
  }
}
