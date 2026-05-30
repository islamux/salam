import 'package:khatir/core/data/model/khatira_lists/khatira_list_pre_new_order.dart';
import 'package:khatir/core/data/static/routes_constant.dart';
import 'package:khatir/core/data/static/theme/app_color_constant.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_pre_cubit.dart';
import 'package:khatir/helpers/extensions/navigation_helper.dart';
import 'package:khatir/view/widget/custom_text_slider/generic_custom_text_slider.dart'; // Changed
import 'package:khatir/core/data/static/imagelink/image_link.dart'; // Added
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/helpers/search/data_search.dart';

class KhatiraPrePage extends StatelessWidget {
  final int? initialPage;

  const KhatiraPrePage({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = KhatiraPreCubit();
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      },
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
                    onPressed: () {
                      final currentPageIndex =
                          context.read<KhatiraPreCubit>().currentPageIndex;
                      context.read<KhatiraPreCubit>().customShareContent(
                          currentPageIndex, khatiraListPreNewOrder);
                    },
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
                  //   context.read<KhatiraPreCubit>().resetCounter();
                  // Ensure resetCounter is invoked
                  // Navigator.pushNamed(context, RoutesConstant.home);
                  context.pushNamed(RoutesConstant.home);
                },
                child: const Icon(Icons.arrow_back),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<KhatiraPreCubit>().decreaseFontSize();
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
                    context.read<KhatiraPreCubit>().increaseFontSize();
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
                      cubit: context.read<KhatiraPreCubit>(),
                      dataList: khatiraListPreNewOrder,
                      backgroundImagePath: ImageLink.image12,
                    ),
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
