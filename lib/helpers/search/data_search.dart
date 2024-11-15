import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:elm/helpers/search/remove_search_diacritics.dart';
import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  final List<ElmModelNewOrder> elmList;

  DataSearch({required this.elmList});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final searchResults = <Widget>[];

    for (var elm in elmList) {
      for (var orderItem in elm.order) {
        List<String>? contentList;
        switch (orderItem) {
          case EnOrder.titles:
            contentList = elm.titles;
            break;
          case EnOrder.subtitles:
            contentList = elm.subtitles;
            break;
          case EnOrder.texts:
            contentList = elm.texts;
            break;
          case EnOrder.ayahs:
            contentList = elm.ayahs;
            break;
          case EnOrder.footer:
            contentList = elm.footer != null ? [elm.footer!] : null;
            break;
        }

        if (contentList != null) {
          for (var content in contentList) {
            // إزالة التشكيل من النصوص و query قبل المقارنة

            if (removeSearchDiacritics(content)
                .contains(removeSearchDiacritics(query))) {
              searchResults.add(
                ListTile(
                  title: Text(content),
                  onTap: () {
                    // يمكن إضافة التنقل للصفحة المطلوبة هنا
                  },
                ),
              );
            }
          }
        }
      }
    }

    return searchResults.isNotEmpty
        ? ListView(children: searchResults)
        : const Center(child: Text("لم يتم العثور على نتائج"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("ابحث عن المحتوى المطلوب"));
  }
}
