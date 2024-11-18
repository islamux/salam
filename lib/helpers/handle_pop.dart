// تعريف دالة لمعالجة الإغلاق
import 'package:elm/helpers/alert_exit_app.dart';
import 'package:flutter/material.dart';

bool handlePop(BuildContext context, bool didPop, dynamic result) {
  alertExitApp(context); // استدعاء دالة التنبيه عند محاولة الإغلاق
  return false; // إرجاع false لمنع الإغلاق الافتراضي
}
