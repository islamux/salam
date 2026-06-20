import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira22Page extends StatelessWidget {
  final int? initialPage;

  const Khatira22Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 22,
      title: AppStrings.khatiraTitle(22),
      initialPage: initialPage,
    );
  }
}
