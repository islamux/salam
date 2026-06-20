import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_29_new_order.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira29Page extends StatelessWidget {
  final int? initialPage;

  const Khatira29Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList29NewOrder,
      title: AppStrings.khatiraTitle(29),
      initialPage: initialPage,
    );
  }
}
