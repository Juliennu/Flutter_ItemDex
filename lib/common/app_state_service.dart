import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/app_state.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/repositories/products_repository.dart';

final appStateServiceProvider =
    StateNotifierProvider<AppStateService, AppState>(
  (ref) => AppStateService(
    productsRepository: ProductsRepositoryImpl(),
  ),
);

class AppStateService extends StateNotifier<AppState> {
  final ProductsRepositoryImpl productsRepository;

  AppStateService({
    required this.productsRepository,
  }) : super(const AppState()) {
    // If required: Do something here to initialize this service
  }

  void addToFavourites(HitProduct hitProduct) {
    var myItems = [...state.myItems];
    myItems.add(hitProduct);
    state = state.copyWith(
      myItems: myItems,
    );
  }
}
