import 'package:elm/core/data/static/theme/app_them.dart';
import 'package:elm/function/call_us_via_whatsup.dart';
import 'package:elm/function/share_app.dart';
import 'package:flutter/material.dart';

class CustomDrawerListView extends StatelessWidget {
  const CustomDrawerListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Make call
        ListTile(
          leading: const Icon(Icons.call_outlined),
          title: Text(
            'تواصل معنا ',
            style: AppTheme.goldenTheme.textTheme.titleMedium,
          ),
          onTap: () => callUsViaWhatsUp(),
        ),

        // Share
        ListTile(
          leading: const Icon(Icons.android_outlined),
          title: Text(
            ' شارك التطبيق عبر وسائل التواصل',
            style: AppTheme.goldenTheme.textTheme.titleMedium,
          ),
          onTap: () => shareApp(),
        ),

        // change theme , dark,light to test it later
          ListTile(
          leading: const Icon(Icons.dark_mode),
          title: Text("تغيير الثيم", style: AppTheme.goldenTheme.textTheme.titleMedium,),
          // onTap: () => Get.changeTheme(
          //   Get.isDarkMode ? ThemeData.light() :ThemeData.dark()),
          ),
        

      ],
    );
  }
}
