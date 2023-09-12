import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:item_dex/data/models/product.dart';

part 'search_screen_state.freezed.dart';

@freezed
class SearchScreenState with _$SearchScreenState {
  const factory SearchScreenState({
    @Default(<HitProduct>[]) List<HitProduct> searchResults,
    @Default(false) bool isSearching,
  }) = _SearchScreenState;
}
