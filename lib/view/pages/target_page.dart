import 'package:flutter/material.dart';

class TargetPage extends StatelessWidget {
  final String content;

  // استلام المحتوى من الصفحة السابقة
  const TargetPage({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('النتيجة المختارة')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(content),
      ),
    );
  }
}
