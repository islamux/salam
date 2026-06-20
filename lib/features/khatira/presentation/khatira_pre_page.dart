import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_pre_new_order.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class KhatiraPrePage extends StatelessWidget {
  final int? initialPage;

  const KhatiraPrePage({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraListPreNewOrder,
      title: AppStrings.preTitle,
      useGoldenTitle: true,
      initialPage: initialPage,
    );
  }
}
