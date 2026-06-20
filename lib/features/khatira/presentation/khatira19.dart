import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira19Page extends StatelessWidget {
  final int? initialPage;

  const Khatira19Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 19,
      title: AppStrings.khatiraTitle(19),
      initialPage: initialPage,
    );
  }
}
