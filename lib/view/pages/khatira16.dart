import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_16_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_16_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira16Page extends StatelessWidget {
  final int? initialPage;

  const Khatira16Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<Khatira16Cubit>(
      createCubit: (_) => Khatira16Cubit(),
      dataList: khatiraList16NewOrder,
      title: AppStrings.khatiraTitle(16),
      initialPage: initialPage,
    );
  }
}
