import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.resultDetail),
      ),
      body: Center(
        child: Text(
          result,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
