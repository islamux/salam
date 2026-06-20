import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/data/lists/khatira_list_final_new_order.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class KhatiraFinalPage extends StatelessWidget {
  final int? initialPage;

  const KhatiraFinalPage({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      dataList: khatiraListFinalNewOrder,
      title: AppStrings.finalTitle,
      useGoldenTitle: true,
      initialPage: initialPage,
    );
  }
}
