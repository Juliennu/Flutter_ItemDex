import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/models/product_data.dart';

class GlobalState {
  final productDataProvider = Provider<ProductData>((ref) {
    return ProductData();
  });
}
