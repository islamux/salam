import 'package:khatir/core/data/model/khatira_model_new_order.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchResults extends SearchState {
  final List<KhatiraModelNewOrder> results;
  SearchResults(this.results);
}
