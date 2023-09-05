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

  void updatePurchasePrice(String id, int? price) {
    // TODO: [リファクタ] map 内でif を使わずに更新したい
    var updatedItems = [...state.myItems].map((item) {
      if (item.id == id) {
        item.purchasePrice = price;
      }
      return item;
    }).toList();

    state = state.copyWith(
      myItems: updatedItems,
    );
  }

  void updatePurchaseDate(String id, DateTime date) {
    var updatedItems = [...state.myItems].map((item) {
      if (item.id == id) {
        item.purchaseDate = date;
      }
      return item;
    }).toList();

    state = state.copyWith(
      myItems: updatedItems,
    );
  }

  void updateWarrantyDate(String id, DateTime date) {
    var updatedItems = [...state.myItems].map((item) {
      if (item.id == id) {
        item.warrantyPriod = date;
      }
      return item;
    }).toList();

    state = state.copyWith(
      myItems: updatedItems,
    );
  }
}
