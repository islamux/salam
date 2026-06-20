import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:flutter/material.dart';

class TargetPage extends StatelessWidget {
  final String content;
  const TargetPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.selectedResult)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}
