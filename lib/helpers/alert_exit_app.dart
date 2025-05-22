import 'dart:io';
import 'package:elm/view/widget/custom_botton.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text("! تنبيه"),
              content: const Text("هل تريد الخروج من التطبيق؟"),
              backgroundColor: const Color.fromRGBO(255, 224, 130, 1),
              actions: [
                CustomButton(
                  customText: "نعم",
                  onPressed: () => exit(0), // إغلاق التطبيق
                  icon: const Icon(Icons.exit_to_app),
                ),
                CustomButton(
                  customText: "لا",
                  onPressed: () =>
                      Navigator.of(context).pop(false), // إلغاء الخروج
                  icon: const Icon(Icons.cancel),
                ),
              ],
              // rtl (for buttons)
              actionsAlignment: MainAxisAlignment.end,
            ),
          );
        },
      ) ??
      false;
}
