import 'package:khatir/core/data/model/khatira_lists/khatira_list_27_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_27_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:khatir/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

class Khatira27Page extends StatelessWidget {
  final int? initialPage;

  const Khatira27Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = Khatira27Cubit();
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      }, // Provide Khatira23Cubit
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
                          context.read<Khatira27Cubit>().currentPageIndex;
                      context.read<Khatira27Cubit>().customShareContent(
                          currentPageIndex, khatiraList27NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(
                    "الخاطرة 27 ",
                    style: TextStyle(
                      color: AppColor.primaryColorGolden,
                    ),
                  ),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context
                      .read<Khatira27Cubit>()
                      .resetCounter(); // Reset counter
                  // Navigator.pushNamed(
                  //     context, RoutesConstant.home); // Navigate to home

                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Khatira27Cubit>()
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
                        .read<Khatira27Cubit>()
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
              // Removed const
              child: Column(
                children: [
                  Expanded(
                    child: GenericCustomTextSlider(
                      // Changed
                      cubit: context.read<Khatira27Cubit>(),
                      dataList: khatiraList27NewOrder,
                      backgroundImagePath: ImageLink.image12,
                    ),
                  ),
                  // Additional elements can be added here if needed
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
