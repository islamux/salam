import 'package:flutter/material.dart';
import 'package:khatir/core/data/model/khatira_lists/khatira_list_pre_new_order.dart';
import 'package:khatir/cubit/khatira_cubits/khatira_pre_cubit.dart';
import 'package:khatir/view/pages/khatira_content_page.dart';

class KhatiraPrePage extends StatelessWidget {
  final int? initialPage;

  const KhatiraPrePage({super.key, this.initialPage});

  @override
  Widget build(BuildContext context) {
    return KhatiraContentPage<KhatiraPreCubit>(
      createCubit: (_) => KhatiraPreCubit(),
      dataList: khatiraListPreNewOrder,
      title: "  المقدمة  ",
      useGoldenTitle: true,
      initialPage: initialPage,
    );
  }
}
