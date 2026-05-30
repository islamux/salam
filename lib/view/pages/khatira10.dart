import 'package:khatir/core/data/model/khatira_lists/khatira_list_10_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_10_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:khatir/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

class Khatira10Page extends StatelessWidget {
  final int? initialPage;

  const Khatira10Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = Khatira10Cubit();
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      }, // Provide Khatira10Cubit
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
                          context.read<Khatira10Cubit>().currentPageIndex;
                      context.read<Khatira10Cubit>().customShareContent(
                          currentPageIndex, khatiraList10NewOrder);
                    },
                    icon: const Icon(Icons.share),
                  ),
                  const Text(" الخاطرة 10 "),
                ],
              ),
              centerTitle: true,
              leading: GestureDetector(
                onTap: () {
                  context.read<Khatira10Cubit>().resetCounter(); // Reset counter
                  // Navigator.pushNamed( context, RoutesConstant.home); // Navigate to home
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context
                        .read<Khatira10Cubit>()
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
                        .read<Khatira10Cubit>()
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
            body: SafeArea( // Removed const
              child: Column(
                children: [
                  Expanded(
                    child: GenericCustomTextSlider( // Changed
                      cubit: context.read<Khatira10Cubit>(),
                      dataList: khatiraList10NewOrder,
                      backgroundImagePath: ImageLink.image12,
                    ),
                  ),
                  // You can add additional elements like the scroll indicator here
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
