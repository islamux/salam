import 'package:khatir/core/data/model/elm_lists/elm_list_1_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/elm_cubits/elm_1_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart';
import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

class Elm1Page extends StatelessWidget {
  final int? initialPage;

  const Elm1Page({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    // Step 1: Create the cubit
    final cubit = Elm1Cubit();
    if (initialPage != null && initialPage! > 0) {
      cubit.goToPageAfterBuild(initialPage!);
    }

    // Step 2: Build the slider content first
    Widget sliderContent = GenericCustomTextSlider(
      cubit: cubit,
      dataList: elmList1NewOrder,
      backgroundImagePath: ImageLink.image12,
    );

    // Step 3: Build the body
    Widget body = SafeArea(
      child: Column(
        children: [
          Expanded(child: sliderContent),
        ],
      ),
    );

    // Step 5: Build the Scaffold
    PreferredSizeWidget appBar = AppBar(
      backgroundColor: AppColor.black,
      foregroundColor: AppColor.amber,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              final currentPageIndex = cubit.currentPageIndex;
              cubit.customShareContent(currentPageIndex, elmList1NewOrder);
            },
            icon: const Icon(Icons.share),
          ),
          const Text("الخاطرة 1"),
        ],
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () {
          cubit.resetCounter();
          context.pushNamed(RoutesConstant.home);
        },
        child: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {
            cubit.decreaseFontSize();
          },
          icon: const Icon(Icons.remove),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("الخط"),
          ],
        ),
        IconButton(
          onPressed: () {
            cubit.increaseFontSize();
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
    );

    // Step 5: Build the Scaffold
    Widget screen = Scaffold(
      appBar: appBar,
      body: body,
    );

    // Step 6: Single return with BlocProvider
    return BlocProvider.value(
      value: cubit,
      child: screen,
    );
  }
}