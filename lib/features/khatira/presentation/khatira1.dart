import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira1Page extends StatelessWidget {
  final int? initialPage;

  const Khatira1Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 1,
      title: AppStrings.khatiraTitle(1),
      initialPage: initialPage,
    );
  }
}
