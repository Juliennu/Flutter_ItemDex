import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/app_state.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/repositories/products_repository.dart';

final appStateServiceProvider =
    StateNotifierProvider<AppStateService, AppState>(
  (ref) => AppStateService(),
);

class AppStateService extends StateNotifier<AppState> {
  final productsRepository = ProductsRepository();

  AppStateService() : super(const AppState()) {
    // If required: Do something here to initialize this service
  }

  Future searchProduct(String keyword) async {
    final searchResults = await productsRepository.searchProduct(keyword);
    state = state.copyWith(
      searchResults: searchResults,
    );
  }

  void addToFavourites(HitProduct hitProduct) {
    var myItems = [...state.myItems];
    myItems.add(hitProduct);
    state = state.copyWith(
      myItems: myItems,
    );
  }
}
