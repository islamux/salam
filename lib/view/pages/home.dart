import 'package:elm/controller/home_controller.dart';
import 'package:elm/core/data/static/imagelink/image_link.dart';
import 'package:elm/core/data/static/theme/app_color_constant.dart';
import 'package:elm/function/alert_exit_app.dart';
import 'package:elm/view/widget/home/custom_drawer_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../function/share_app.dart';
import '../widget/custom_botton.dart';
import '../widget/home/search/custom_data_search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeControllerImp controllerE = Get.find<HomeControllerImp>();

    return PopScope(
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
                //  color: AppColor.primaryColorGolden,
                fontSize: 21,
              ),
            ),
            centerTitle: true,

            //  Search on Pages
            actions: [
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                },
                icon: const Icon(Icons.search),
              ),

              // Share button
              TextButton(
                onPressed: () => shareApp(),
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
            // Change direction of text inside drawer in right side of page
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
                      image: AssetImage(
                        // Link of folder images from my custom class
                        ImageLink.image5,
                      ),
                      fit: BoxFit.cover),
                ),
              ),

              // إسحب للإعلى للمزيد
              Padding(
                padding: EdgeInsets.only(
                  // make the space for any screen
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
                    scrollDirection:
                        Axis.vertical, // make sure of scroll direction
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          // Button 1
                          customText: "خواطر متفرقة حول الدين والحياة",
                          onPressed: () => controllerE.goToElmPre(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 2
                          customText: "(1) عوامل تفكك وفشل الأسرة والقبيلة",
                          onPressed: () => controllerE.goToElm1(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 3
                          customText: "(2)  العلم والمعرفة    ",
                          onPressed: () => controllerE.goToElm2(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 4
                          customText: "(3) العطاء ليس مقياس لحب الله للعبد",
                          onPressed: () => controllerE.goToElm3(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 5
                          customText: " (4) المحبة الإلهية   ",
                          onPressed: () => controllerE.goToElm4(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 6
                          customText: "  (5)   العدل      ",
                          onPressed: () => controllerE.goToElm5(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 7
                          customText: "  (6)   الشرك الخفي     ",
                          onPressed: () => controllerE.goToElm6(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        CustomButton(
                          // Button 8
                          customText: "  (7)   التوكل على الله     ",
                          onPressed: () => controllerE.goToElm7(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 9
                        CustomButton(
                          customText: " (8)   المعية الإلهية",
                          onPressed: () => controllerE.goToElm8(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 10
                        CustomButton(
                          customText: "(9) فأما اليتيم فلا تقهر ",
                          onPressed: () => controllerE.goToElm9(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 11
                        CustomButton(
                          customText: " (10) والذين جاهدو فينا",
                          onPressed: () => controllerE.goToElm10(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 12
                        CustomButton(
                          customText: " (11)   الرزق",
                          onPressed: () => controllerE.goToElm11(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 12
                        CustomButton(
                          customText: "(12) وإنك لعلى خلق عظيم",
                          onPressed: () => controllerE.goToElm12(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 13
                        CustomButton(
                          customText: "(13) مأ أصابكم من مصيبة ",
                          onPressed: () => controllerE.goToElm13(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 14
                        CustomButton(
                          customText: "(14)  الإسلام دين شامل",
                          onPressed: () => controllerE.goToElm14(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 15
                        CustomButton(
                          customText: "(15) العزة لله  ",
                          onPressed: () => controllerE.goToElm15(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 16
                        CustomButton(
                          customText: "(16)  المرأة الصالحة  ",
                          onPressed: () => controllerE.goToElm16(),
                          icon: const Icon(Icons.menu_book),
                        ),

                        // Button 14
                        CustomButton(
                          customText: " (17)   الدعاء",
                          onPressed: () => controllerE.goToElm17(),
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
    );
  }
}
