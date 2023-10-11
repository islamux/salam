import 'package:elm/core/data/model/elm_list_model.dart';
import 'package:elm/core/data/model/elm_model.dart';
import 'package:elm/function/remove_search_diacritics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_search_result.dart';

class DataSearch extends SearchDelegate {
  final List<ElmModel> elm = [
    ...elmList,
  ];

  @override
  String get searchFieldLabel => "إبحث";

  @override
  TextStyle get searchFieldStyle => const TextStyle(fontSize: 17);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final String queryWithoutDiacritics =
        removeSearchDiacritics(query.toLowerCase());
    final List<ElmModel> filteredelm = query.isEmpty
        ? elm
        : elm.where((element) {
            final String elmTextWithoutDiacritics =
                removeSearchDiacritics(element.elmText!.toLowerCase());
            return elmTextWithoutDiacritics.contains(queryWithoutDiacritics);
          }).toList();

    return ListView.separated(
      itemCount: filteredelm.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        final ElmModel elmModel = filteredelm[index];
        return InkWell(
          onTap: () {
            Get.to(() => CustomSearchResultPage(elm: elmModel));
          },
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Text('${elmModel.elmText}'),
            ),
          ),
        );
      },
    );
  }
}
