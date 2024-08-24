import 'package:elm/core/data/model/khatira_page_content.dart';
import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:flutter/material.dart';

class ElmTextDersThree {
  static final List<KhatiraPageContent> pages = [
    KhatiraPageContent(content: [
      TextSpan(text: """
""", style: AppTheme.customTextStyleHadith()),
      TextSpan(text: """
""", style: AppTheme.customTextStyleText())
    ])
  ];
}
