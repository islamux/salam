import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/core/theme/app_color_constant.dart';
import 'package:khatir/core/cubit/base_page_cubit.dart';
import 'package:khatir/core/cubit/base_page_state.dart';
import 'package:khatir/core/data/repository/khatira_repository.dart';
import 'package:khatir/core/services/navigation_helper.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:khatir/features/search/data_search.dart';
import 'package:khatir/core/widgets/custom_text_slider/generic_custom_text_slider.dart';

class KhatiraContentPage extends StatelessWidget {
  final int chapterId;
  final String title;
  final bool useGoldenTitle;
  final int? initialPage;
  final String backgroundImagePath;

  const KhatiraContentPage({
    super.key,
    required this.chapterId,
    required this.title,
    this.useGoldenTitle = false,
    this.initialPage,
    this.backgroundImagePath = ImageLink.image12,
  });

  @override
  Widget build(BuildContext context) {
    final repository = context.read<KhatiraRepository>();
    return BlocProvider<BasePageCubit>(
      create: (context) {
        final cubit = BasePageCubit(
          repository: repository,
          chapterId: chapterId,
        );
        if (initialPage != null && initialPage! > 0) {
          cubit.goToPageAfterBuild(initialPage!);
        }
        return cubit;
      },
      child: Builder(
        builder: (context) {
          final cubit = context.read<BasePageCubit>();
          return BlocBuilder<BasePageCubit, BasePageState>(
            builder: (context, state) {
              if (state is! PageDataLoaded) {
                return const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                );
              }
              if (state.data.isEmpty) {
                return const Scaffold(
                  body: Center(child: Text('No content available')),
                );
              }
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.black,
                  foregroundColor: AppColor.amber,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.customShareContent(cubit.currentPageIndex);
                        },
                        icon: const Icon(Icons.share),
                      ),
                      useGoldenTitle
                          ? Text(title,
                              style: const TextStyle(
                                  color: AppColor.primaryColorGolden))
                          : Text(title),
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
                      onPressed: () => cubit.decreaseFontSize(),
                      icon: Icon(Icons.remove),
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(AppStrings.fontLabel)],
                    ),
                    IconButton(
                      onPressed: () => cubit.increaseFontSize(),
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
                  child: Column(
                    children: [
                      Expanded(
                        child: GenericCustomTextSlider(
                          cubit: cubit,
                          dataList: cubit.data,
                          backgroundImagePath: backgroundImagePath,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
