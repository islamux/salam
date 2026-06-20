import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_1_new_order.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira1Page extends StatelessWidget {
  final int? initialPage;

  const Khatira1Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList1NewOrder,
      title: AppStrings.khatiraTitle(1),
      initialPage: initialPage,
    );
  }
}
