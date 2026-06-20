import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_19_new_order.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira19Page extends StatelessWidget {
  final int? initialPage;

  const Khatira19Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList19NewOrder,
      title: AppStrings.khatiraTitle(19),
      initialPage: initialPage,
    );
  }
}
