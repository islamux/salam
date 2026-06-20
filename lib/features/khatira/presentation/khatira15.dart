import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira15Page extends StatelessWidget {
  final int? initialPage;

  const Khatira15Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 15,
      title: AppStrings.khatiraTitle(15),
      initialPage: initialPage,
    );
  }
}
