import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/data/repositories/products_repository.dart';
import 'package:item_dex/screens/search/search_screen_state.dart';

class SearchScreenViewModel extends StateNotifier<SearchScreenState> {
  SearchScreenViewModel({
    required this.productsRepository,
  }) : super(const SearchScreenState());

  final ProductsRepositoryImpl productsRepository;

  bool get isSearching => state.isSearching;

  set isSearching(bool value) {
    state = state.copyWith(
      isSearching: value,
    );
  }

  Future searchProduct(String keyword) async {
    final searchResults = await productsRepository.searchProduct(keyword);
    state = state.copyWith(
      searchResults: searchResults,
    );
  }
}
