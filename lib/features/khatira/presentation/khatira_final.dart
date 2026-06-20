import 'package:flutter/material.dart';
import 'package:khatir/features/khatira/presentation/khatira_content_page.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';

class KhatiraFinalPage extends StatelessWidget {
  final int? initialPage;

  const KhatiraFinalPage({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage(
      chapterId: 33,
      title: AppStrings.finalTitle,
      useGoldenTitle: true,
      initialPage: initialPage,
    );
  }
}
