import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/repositories/search.dart';

class GlobalState {
  // StateProvider は変数を入れることができる
  final searchResultsProvider = StateProvider<List<HitProduct>>((ref) {
    return [];
  });

  final myItemsProvider = StateProvider<List<HitProduct>>((ref) {
    return [
    ];
  });

  final searchResultFutureProvider =
      FutureProvider.family<List<HitProduct>, String>((ref, keyword) async {
    final result = await SearchRepository().searchProduct(keyword);
    return result;
  });
}
