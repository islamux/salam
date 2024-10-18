import 'package:elm/controller/home_cubit_controller/home_cubit.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/alert_exit_app.dart';
import 'package:elm/view/widget/home/custom_drawer_listview.dart';
import 'package:elm/view/widget/custom_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        alertExitApp();
        return false;
      },
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.black,
            foregroundColor: AppColor.amber,
            title: const Text(
              "خواطر إيمانية",
              style: TextStyle(
                fontSize: 21,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  // Search functionality (disabled for now)
                },
                icon: const Icon(Icons.search),
              ),
              TextButton(
                onPressed: () {
                  // Sharing functionality (disabled for now)
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
                    child: BlocBuilder<HomeCubit, HomeState>(
                      builder: (context, state) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomButton(
                              customText: "خواطر متفرقة حول الدين والحياة",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElmPre(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            CustomButton(
                              customText: "(1) عوامل تفكك وفشل الأسرة والقبيلة",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElm1(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            CustomButton(
                              customText: "(2) العلم والمعرفة",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElm2(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            CustomButton(
                              customText: "(3) العطاء ليس مقياس لحب الله للعبد",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElm3(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            CustomButton(
                              customText: "(4) المحبة الإلهية",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElm4(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            CustomButton(
                              customText: "(5) العدل",
                              onPressed: () =>
                                  context.read<HomeCubit>().goToElm5(context),
                              icon: const Icon(Icons.menu_book),
                            ),
                            // Add more buttons here as needed
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
