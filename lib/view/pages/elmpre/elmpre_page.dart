import 'package:elm/controller/elm_pre_cubit_controller/elmpre_cubit.dart';
import 'package:elm/core/data/static/routes_constant.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/view/widget/custom_text_slider/sliders/customtextsliderprecubit/custom_text_slider_elmpre.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElmPrePage extends StatelessWidget {
  const ElmPrePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElmPreCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.amber,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    // Share content with cubit
                    onPressed: () =>
                        context.read<ElmPreCubit>().customShareContent(),
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "  المقدمة  ",
                    style: TextStyle(
                      color: AppColor.primaryColorGolden,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<ElmPreCubit>().resetCounter();
                  // Ensure resetCounter is invoked
                  Navigator.pushNamed(context, RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<ElmPreCubit>().decreaseFontSize();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Center(
                  child: Text(
                    "الخط",
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<ElmPreCubit>()
                        .increasFontSize(); // Fixed typo (increaseFontSize)
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            body: const SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child:
                        CustomTextSliderElmPre(), // Display your custom text slider here
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}



// import 'package:elm/controller/elm_pre_cubit_controller/elmpre_cubit.dart';
// import 'package:elm/core/data/static/routes_constant.dart';
// import 'package:elm/core/data/static/theme/app_color_constant.dart';
// import 'package:elm/view/widget/custom_text_slider/sliders/customtextsliderprecubit/custom_text_slider_elmpre.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ElmPrePage extends StatelessWidget {
//   const ElmPrePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => ElmPreCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColor.black,
//           foregroundColor: AppColor.amber,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 // Share content with cubit
//                 onPressed: () =>
//                     context.read<ElmPreCubit>().customShareContent(),
//                 icon: const Icon(Icons.share),
//               ),
//               const Text(
//                 "  المقدمة  ",
//                 style: TextStyle(
//                   color: AppColor.primaryColorGolden,
//                 ),
//               ),
//             ],
//           ),
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               context
//                   .read<ElmPreCubit>()
//                   .resetCounter(); // Ensure resetCounter is invoked
//               Navigator.pushNamed(context, AppRoute.home);
//             },
//             child: const Icon(Icons.arrow_back),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 context.read<ElmPreCubit>().decreaseFontSize();
//               },
//               icon: const Icon(Icons.remove),
//             ),
//             const Center(
//               child: Text(
//                 "الخط",
//               ),
//             ),
//             IconButton(
//               onPressed: () {
//                 context
//                     .read<ElmPreCubit>()
//                     .increastFontSize(); // Fixed typo (increaseFontSize)
//               },
//               icon: const Icon(Icons.add),
//             )
//           ],
//         ),
//         body: const SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child:
//                     CustomTextSliderElmPre(), // Display your custom text slider here
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }





// import 'package:elm/controller/elm_pre_cubit_controller/elmpre_cubit.dart';
// import 'package:elm/core/data/static/routes_constant.dart';
// import 'package:elm/core/data/static/theme/app_color_constant.dart';
// import 'package:elm/view/widget/custom_text_slider/sliders/customtextsliderprecubit/custom_text_slider_elmpre.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class ElmPrePage extends StatelessWidget {
//   const ElmPrePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     //ElmPreControllerImp controllerAs = Get.put(AthkarSabahControllerImp());
//     return BlocProvider(
//       create: (context) => ElmPreCubit(),
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: AppColor.black,
//           foregroundColor: AppColor.amber,
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                 // share content with cubit
//                 onPressed: () =>
//                     BlocProvider.of<ElmPreCubit>(context).customShareContent(),
//                 icon: const Icon(Icons.share),
//               ),
//               const Text(
//                 "  المقدمة  ",
//                 style: TextStyle(
//                   color: AppColor.primaryColorGolden,
//                   //     backgroundColor: AppColor.primaryColorBlack2
//                 ),
//               ),
//             ],
//           ),
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               context.read<ElmPreCubit>().resetCounter;
//               Navigator.pushNamed(context, AppRoute.home);
//               // Get.find<ElmPreControllerImp>().resetCounter();
//               // Get.toNamed(AppRoute.home);
//             },
//             child: const Icon(Icons.arrow_back),
//           ),
//           actions: [
//             IconButton(
//               onPressed: () {
//                 context.read<ElmPreCubit>().decreaseFontSize();
//                 //controllerAs.decreaseFontSize();
//                 // decreaseFont(controllerAs);
//               },
//               icon: const Icon(Icons.remove),
//             ),
//             // Font between + -
//             const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "الخط",
//                   //    style: TextStyle(color: AppColor.primaryColorGolden),
//                 ),
//               ],
//             ),

//             IconButton(
//                 onPressed: () {
//                   context.read<ElmPreCubit>().increastFontSize();
//                   //controllerAs.increaseFontSize();
//                   //   increaseFont(controllerAs);
//                 },
//                 icon: const Icon(Icons.add))
//           ],
//         ),
//         body: const SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 child: CustomTextSliderElmPre(),
//               ),
//               // Slider to control the page

//               // Scroll down indicator to tell user scroll down to reach to the end of txt
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
