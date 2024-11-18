import 'package:flutter/material.dart';

// صفحة جديدة لعرض تفاصيل البحث
class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل النتيجة'),
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
