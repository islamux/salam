import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:khatir/core/data/static/imagelink/image_link.dart';
import 'package:khatir/core/routing/routes_constant.dart';
import 'package:khatir/core/data/static/strings/app_strings.dart';
import 'package:khatir/core/theme/app_color_constant.dart';
import 'package:khatir/core/cubit/base_page_cubit.dart';
import 'package:khatir/core/services/navigation_helper.dart';
import 'package:khatir/core/services/handle_pop.dart';
import 'package:khatir/features/search/data_search.dart';
import 'package:khatir/features/home/presentation/custom_drawer_listview.dart';

import 'package:khatir/core/widgets/custom_botton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BasePageCubit(),
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPost, result) =>
            handlePop(context, didPost, result),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.amber,
              title: const Text(
                AppStrings.homeAppBarTitle,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    // showSearch();
                    showSearch(context: context, delegate: DataSearch());
                  },
                  icon: const Icon(Icons.search),
                ),
                TextButton(
                  onPressed: () {
                    //todo
                    // Share functionality could be added here
                  },
                  child: const Text(
                    AppStrings.homeShareButton,
                    style: TextStyle(
                      color: AppColor.primaryColorGolden,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            drawer: const Directionality(
              textDirection: TextDirection.rtl,
              child: Drawer(
                backgroundColor: AppColor.primaryColorGolden,
                child: CustomDrawerListView(),
              ),
            ),
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageLink.image5),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.1,
                    right: MediaQuery.of(context).size.width * 0.3,
                  ),
                  child: const Column(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        color: AppColor.primaryColorGolden,
                        size: 36,
                      ),
                      Text(
                        AppStrings.homeScrollHint,
                        style: TextStyle(
                          color: AppColor.primaryColorGolden,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 160, bottom: 130),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomButton(
                            customText: "خواطر متفرقة حول الدين والحياة",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElmPre(context);
                              context.pushNamed(RoutesConstant.khatiraPre);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(1) عوامل تفكك وفشل الأسرة والقبيلة",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm1(context);
                              context.pushNamed(RoutesConstant.khatira1);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(2) العلم والمعرفة",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm2(context);
                              context.pushNamed(RoutesConstant.khatira2);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(3) العطاء ليس مقياس لحب الله للعبد",
                            onPressed: () {
                              //context.read<HomeCubit>().goToElm3(context);
                              context.pushNamed(RoutesConstant.khatira3);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (4) المحبة الإلهية",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm4(context);
                              context.pushNamed(RoutesConstant.khatira4);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (5)   العدل",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm5(context);
                              context.pushNamed(RoutesConstant.khatira5);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (6)   الشرك الخفي",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm6(context);
                              context.pushNamed(RoutesConstant.khatira6);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (7)   التوكل على الله",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm7(context);
                              context.pushNamed(RoutesConstant.khatira7);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (8)   المعية الإلهية",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm8(context);
                              context.pushNamed(RoutesConstant.khatira8);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(9) فأما اليتيم فلا تقهر ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm9(context);
                              context.pushNamed(RoutesConstant.khatira9);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (10) والذين جاهدو فينا",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm10(context);
                              context.pushNamed(RoutesConstant.khatira10);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (11)   الرزق",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm11(context);
                              context.pushNamed(RoutesConstant.khatira11);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(12) وإنك لعلى خلق عظيم",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm12(context);
                              context.pushNamed(RoutesConstant.khatira12);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(13) مأ أصابكم من مصيبة ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm13(context);
                              context.pushNamed(RoutesConstant.khatira13);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(14)  الإسلام دين شامل",
                            onPressed: () {
                              //context.read<HomeCubit>().goToElm14(context);
                              context.pushNamed(RoutesConstant.khatira14);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(15) العزة لله  ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm15(context);
                              context.pushNamed(RoutesConstant.khatira15);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(16)  المرأة الصالحة  ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm16(context);
                              context.pushNamed(RoutesConstant.khatira16);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (17)   الدعاء",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm17(context);
                              context.pushNamed(RoutesConstant.khatira17);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (18)   مقتطفات",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm18(context);
                              context.pushNamed(RoutesConstant.khatira18);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (19)   أولياء الله",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm19(context);
                              context.pushNamed(RoutesConstant.khatira19);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (20)   التقوى",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm20(context);
                              context.pushNamed(RoutesConstant.khatira20);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (21)  الصبر ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm21(context);
                              context.pushNamed(RoutesConstant.khatira21);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (22)  الحمد ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm21(context);
                              context.pushNamed(RoutesConstant.khatira22);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (23)  يدبر الأمر ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm23(context);
                              context.pushNamed(RoutesConstant.khatira23);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(24) شكر النعمة أمان من زوالها",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm23(context);
                              context.pushNamed(RoutesConstant.khatira24);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(25) قد أفلح المؤمنون",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm23(context);
                              context.pushNamed(RoutesConstant.khatira25);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(26) الكبــــــــر ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm23(context);
                              context.pushNamed(RoutesConstant.khatira26);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(27) الأمر بالمعروف والنهي عن المنكر ",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira27);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(28) لا تخف إنك أنت الأعلى",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira28);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(29) الطيران في الجنة",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira29);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(30) ياليتني قدمت لحياتي",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira30);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(31) يا بني اركب معنا",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira31);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(32) الإحساس بالنذالة شيء لايطاق",
                            onPressed: () {
                              context.pushNamed(RoutesConstant.khatira32);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (خاتمة)  المصير المحتوم ",
                            onPressed: () {
                              // context.read<HomeCubit>().goToElm22(context);
                              context.pushNamed(RoutesConstant.khatiraFinal);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
