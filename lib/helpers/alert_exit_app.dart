import 'dart:io';
import 'package:elm/view/widget/custom_botton.dart';
import 'package:flutter/material.dart';

Future<bool> alertExitApp(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
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
          );
        },
      ) ??
      false;
}


// import 'dart:io';


// import 'package:elm/core/data/static/theme/app_color_constant.dart';
// import 'package:elm/view/widget/custom_botton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // using my custom buttom
// Future<bool> alertExitApp() {
//   Get.defaultDialog(
//     title: "! تنبيه  ",
//     middleText: "هل تريد الخروج من التطبيق ؟",
//     backgroundColor: const Color.fromRGBO(255, 224, 130, 1),
//     confirmTextColor: AppColor.black,
//     actions: [
//       CustomButton(
//           customText: "نعم ",
//           onPressed: () => exit(0),
//           icon: const Icon(Icons.exit_to_app)),
//       CustomButton(
//           customText: "لا",
//           onPressed: () => Get.back(),
//           icon: const Icon(Icons.cancel)),
//     ],
//   );
//   return Future.value(true);
// }

// import 'dart:io';
// import 'package:elm/cubit/elm_cubits/exit_cubit.dart';
// import 'package:elm/view/widget/custom_botton.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// void showExitDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: const Text("! تنبيه"),
//         content: const Text("هل تريد الخروج من التطبيق؟"),
//         backgroundColor: const Color.fromRGBO(255, 224, 130, 1),
//         actions: [
//           CustomButton(
//             customText: "نعم",
//             onPressed: () {
//               exit(0);
//             },
//             icon: const Icon(Icons.exit_to_app),
//           ),
//           CustomButton(
//             customText: "لا",
//             onPressed: () {
//               context.read<ExitCubit>().cancelExit();
//               Navigator.of(context).pop();
//             },
//             icon: const Icon(Icons.cancel),
//           ),
//         ],
//       );
//     },
//   );
// }
