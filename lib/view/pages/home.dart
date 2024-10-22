import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/cubit/pages_cubits/home_cubit.dart';
import 'package:elm/function/alert_exit_app.dart';
import 'package:elm/view/widget/home/custom_drawer_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widget/custom_botton.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(), // Provide HomeCubit
      child: PopScope(
        canPop: true,
        onPopInvoked: (didPop) => alertExitApp(),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.amber,
              title: const Text(
                " خواطر إيمانية",
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              centerTitle: true,
              actions: [
                IconButton(
                  onPressed: () {
                    // showSearch(context: context, delegate: ()); // Disabled for now
                  },
                  icon: const Icon(Icons.search),
                ),
                TextButton(
                  onPressed: () {
                    // Share functionality could be added here
                  },
                  child: const Text(
                    "شارك",
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
                        "إسحب للأعلى للمزيد",
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
                              context.read<HomeCubit>().goToElmPre(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(1) عوامل تفكك وفشل الأسرة والقبيلة",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm1(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(2) العلم والمعرفة",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm2(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(3) العطاء ليس مقياس لحب الله للعبد",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm3(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (4) المحبة الإلهية",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm4(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (5)   العدل",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm5(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (6)   الشرك الخفي",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm6(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "  (7)   التوكل على الله",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm7(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (8)   المعية الإلهية",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm8(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(9) فأما اليتيم فلا تقهر ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm9(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (10) والذين جاهدو فينا",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm10(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (11)   الرزق",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm11(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(12) وإنك لعلى خلق عظيم",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm12(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(13) مأ أصابكم من مصيبة ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm13(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(14)  الإسلام دين شامل",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm14(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(15) العزة لله  ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm15(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: "(16)  المرأة الصالحة  ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm16(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (17)   الدعاء",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm17(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (18)   مقتطفات",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm18(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (19)   أولياء الله",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm19(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (20)   التقوى",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm20(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (21)  الصبر ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm21(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (23)  يدبر الأمر ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm23(context);
                            },
                            icon: const Icon(Icons.menu_book),
                          ),
                          CustomButton(
                            customText: " (خاتمة)  المصير المحتوم ",
                            onPressed: () {
                              context.read<HomeCubit>().goToElm22(context);
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
