import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira2Page extends StatelessWidget {
  final int? initialPage;

  const Khatira2Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 2,
      title: AppStrings.khatiraTitle(2),
      initialPage: initialPage,
    );
  }
}
