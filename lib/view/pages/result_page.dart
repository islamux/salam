import 'package:elm/core/data/model/elm_model_new_order.dart';
import 'package:elm/core/data/model/enum_order.dart';
import 'package:flutter/material.dart';

// صفحة جديدة لعرض تفاصيل البحث
class ResultPage extends StatelessWidget {
  final String result;

  const ResultPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تفاصيل النتيجة'),
      ),
      body: Center(
        child: Text(
          result,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

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
            if (content.contains(query)) {
              searchResults.add(
                ListTile(
                  title: Text(content),
                  onTap: () {
                    // Navigate to the relevant page
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
        : const Center(child: Text("No results found"));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("Search for content"));
  }
}
