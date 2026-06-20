import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_23_new_order.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira23Page extends StatelessWidget {
  final int? initialPage;

  const Khatira23Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList23NewOrder,
      title: AppStrings.khatiraTitle(23),
      initialPage: initialPage,
    );
  }
}
