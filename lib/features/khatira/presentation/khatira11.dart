import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_11_new_order.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira11Page extends StatelessWidget {
  final int? initialPage;

  const Khatira11Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraList11NewOrder,
      title: AppStrings.khatiraTitle(11),
      initialPage: initialPage,
    );
  }
}
