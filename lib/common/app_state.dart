import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:item_dex/models/product.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(<HitProduct>[]) List<HitProduct> myItems,
  }) = _AppState;
}
