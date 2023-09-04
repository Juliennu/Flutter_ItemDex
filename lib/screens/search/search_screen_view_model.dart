import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/screens/search/search_screen_state.dart';

class SearchScreenViewModel extends StateNotifier<SearchScreenState> {
  SearchScreenViewModel() : super(const SearchScreenState());

  bool get isSearching => state.isSearching;

  set isSearching(bool value) {
    state = state.copyWith(
      isSearching: value,
    );
  }
}
