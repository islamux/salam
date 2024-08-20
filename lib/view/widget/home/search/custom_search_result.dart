import 'package:elm/core/data/model/khatira_page_content.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';

class CustomSearchResultPage extends StatelessWidget {
  final KhatiraPageContent elm;

  const CustomSearchResultPage({super.key, required this.elm});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.black,
          title: const Text(
            ' نتائج البحث',
            style: TextStyle(
                color: AppColor.primaryColorGolden,
                backgroundColor: AppColor.primaryColorBlack2),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Text(
            elm.content as String, // change later
            /*** todo */
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
