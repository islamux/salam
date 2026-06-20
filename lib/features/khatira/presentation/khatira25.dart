import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira25Page extends StatelessWidget {
  final int? initialPage;

  const Khatira25Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 25,
      title: AppStrings.khatiraTitle(25),
      initialPage: initialPage,
    );
  }
}
