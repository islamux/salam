import 'package:khatir/core/data/model/khatira_lists/khatira_list_7_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_7_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:khatir/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

class Khatira7Page extends StatelessWidget {
  final int? initialPage;

  const Khatira7Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = Khatira7Cubit();
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      }, // Provide Khatira7Cubit
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
                    // Share content using cubit
                    onPressed: () {
                      final currentPageIndex =
                          context.read<Khatira7Cubit>().currentPageIndex;
                      context.read<Khatira7Cubit>().customShareContent(
                          currentPageIndex, khatiraList7NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 7 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context
                      .read<Khatira7Cubit>()
                      .resetCounter(); // Reset counter before going back
                  // Navigator.pushNamed(context, RoutesConstant.home);
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Khatira7Cubit>()
                        .decreaseFontSize(); // Decrease font size
                  },
                  icon: const Icon(Icons.remove),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("الخط"), // Font label
                  ],
                ),
                IconButton(
                  onPressed: () {
                    context
                        .read<Khatira7Cubit>()
                        .increaseFontSize(); // Increase font size
                  },
                  icon: const Icon(Icons.add),
                ),
                              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: const Icon(Icons.search),
                ),
],
            ),
            body: SafeArea(
              child: GestureDetector( // GestureDetector can likely be removed if not needed for other purposes
                onTap: () {
                  Feedback.forTap(context);
                },
                child: GenericCustomTextSlider( // Changed
                  cubit: context.read<Khatira7Cubit>(),
                  dataList: khatiraList7NewOrder,
                  backgroundImagePath: ImageLink.image12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
