import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:khatir/core/data/model/khatira_model_new_order.dart';
import 'package:khatir/features/search/cubit/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  void searchContent(String query, List<KhatiraModelNewOrder> khatiraList) {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    final results = khatiraList.where((item) {
      final containsInTitles =
          item.titles?.any((title) => title.contains(query)) ?? false;
      final containsInSubtitles =
          item.subtitles?.any((subtitle) => subtitle.contains(query)) ?? false;
      final containsInTexts =
          item.texts?.any((text) => text.contains(query)) ?? false;
      final containsInAyahs =
          item.ayahs?.any((ayah) => ayah.contains(query)) ?? false;
      final containsInFooter = item.footer?.contains(query) ?? false;

      return containsInTitles ||
          containsInSubtitles ||
          containsInTexts ||
          containsInAyahs ||
          containsInFooter;
    }).toList();

    emit(SearchResults(results));
  }
}
