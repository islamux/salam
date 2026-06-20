import 'dart:io';
import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:khatir/core/widgets/custom_botton.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              title: const Text(AppStrings.alertTitle),
              content: const Text(AppStrings.alertExitMessage),
              backgroundColor: const Color.fromRGBO(255, 224, 130, 1),
              actions: [
                CustomButton(
                  customText: AppStrings.alertYes,
                  onPressed: () => exit(0),
                  icon: const Icon(Icons.exit_to_app),
                ),
                CustomButton(
                  customText: AppStrings.alertNo,
                  onPressed: () => Navigator.of(context).pop(false),
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
