import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class Khatira31Page extends StatelessWidget {
  final int? initialPage;

  const Khatira31Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 31,
      title: AppStrings.khatiraTitle(31),
      initialPage: initialPage,
    );
  }
}
