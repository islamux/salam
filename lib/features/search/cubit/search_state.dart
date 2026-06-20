import 'package:khatir/core/data/model/khatira_model_order.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchResults extends SearchState {
  final List<KhatiraModelOrder> results;
  SearchResults(this.results);
}
