import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:flutter/material.dart';

class CustomSearchResultPage extends StatelessWidget {
  final ElmModel elm;

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
            elm.elmText!,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}
