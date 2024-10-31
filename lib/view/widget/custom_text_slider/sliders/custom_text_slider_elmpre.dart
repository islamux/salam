import 'package:elm/core/data/model/elm_lists/elm_list_pre_new_order.dart';
import 'package:elm/cubit/base_cubit/base_page_state.dart';
import 'package:elm/core/data/model/elm_lists/elm_list_pre_new.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/elm_cubits/elm_pre_cubit.dart';
import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_pre_new_order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextSliderElmPre extends StatelessWidget {
  const CustomTextSliderElmPre({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ElmPreCubit, BasePageState>(
      builder: (context, state) {
        ElmPreCubit cubit = context.read<ElmPreCubit>();

        return Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageLink.image12),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                reverse: true,
                controller: cubit.pageController,
                onPageChanged: (index) => cubit.onPageChanged(index),
                itemCount: elmListPreNew.length,
                itemBuilder: (context, i) {
                  List<TextSpan> pageTexts =
                      whichPageToGetInPrerOrder(i, elmListPreNewOrder);

                  return Column(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 60, left: 32, right: 32, bottom: 60),
                          child: SingleChildScrollView(
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontFamily: "AmiriQ",
                                  fontSize: cubit.fontSize,
                                  color: Colors.black,
                                ),
                                children: pageTexts,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Positioned(
              bottom: 16,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Slider(
                      activeColor: AppColor.black,
                      inactiveColor: AppColor.grey,
                      value: (cubit.currentPageIndex ?? 0)
                          .toDouble(), // Null check added
                      onChanged: (double value) {
                        cubit.goToPage(value.toInt());
                      },
                      min: 0,
                      max: elmListPreNew.length.toDouble() - 1,
                    ),
                  ),
                  Text(
                    '${(cubit.currentPageIndex ?? 0) + 1} / ${elmListPreNew.length}', // Null check added
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}





// import 'package:elm/controller/elm_pre_cubit_controller/elm_pre_cubit_state.dart';
// import 'package:elm/controller/elm_pre_cubit_controller/elmpre_cubit.dart';
// import 'package:elm/core/data/model/elm_lists/elm_list_pre_new.dart';
// import 'package:elm/core/data/static/imagelink/image_link.dart';
// import 'package:elm/core/data/static/theme/app_color_constant.dart';
// import 'package:elm/view/widget/custom_text_slider/which_page_to_get/which_page_to_get_in_elm_pre_new.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CustomTextSliderElmPre extends StatelessWidget {
//   const CustomTextSliderElmPre({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ElmPreCubit, ElmpreState>(
//       builder: (context, state) {
//         var cubit = context.read<ElmPreCubit>();

//         return Stack(
//           children: [
//             // Background Image
//             Container(
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage(ImageLink.image12),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // PageView Slider
//             SizedBox(
//               height: MediaQuery.of(context).size.height,
//               child: PageView.builder(
//                 reverse: true,
//                 controller: cubit.pageControllerAssma,
//                 onPageChanged: (index) => cubit.onPageChanged(index),
//                 itemCount: elmListPreNew.length,
//                 itemBuilder: (context, i) {
//                   List<TextSpan> pageTexts =
//                       whichPageToGetInPreNew(i, elmListPreNew);

//                   return Column(
//                     children: [
//                       Expanded(
//                         child: Container(
//                           padding: const EdgeInsets.only(
//                               top: 60, left: 32, right: 32, bottom: 60),
//                           child: SingleChildScrollView(
//                             child: RichText(
//                               text: TextSpan(
//                                 style: TextStyle(
//                                   fontFamily: "AmiriQ",
//                                   fontSize: cubit
//                                       .fontSize, // Dynamically controlled font size
//                                   color: Colors.black,
//                                 ),
//                                 children:
//                                     pageTexts, // Text content for each page
//                               ),
//                               textAlign: TextAlign.right,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//             // Slider at the bottom for navigation
//             Positioned(
//               bottom: 16,
//               left: 0,
//               right: 0,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Expanded(
//                     child: Slider(
//                       activeColor: AppColor.black,
//                       inactiveColor: AppColor.grey,
//                       value: cubit.currentPageIndex.toDouble(),
//                       onChanged: (double value) {
//                         cubit.goToPage(value.toInt()); // Move to selected page
//                       },
//                       min: 0,
//                       max: elmListPreNew.length.toDouble() -
//                           1, // Number of pages
//                     ),
//                   ),
//                   // Display the current page number
//                   Text(
//                     '${cubit.currentPageIndex + 1} / ${elmListPreNew.length}',
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
