import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_28_new_order.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira28Page extends StatelessWidget {
  final int? initialPage;

  const Khatira28Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList28NewOrder,
      title: AppStrings.khatiraTitle(28),
      initialPage: initialPage,
    );
  }
}
