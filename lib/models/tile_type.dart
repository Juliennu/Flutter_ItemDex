import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';

enum TileType {
  purchasePrice,
  purchaseDate,
  warrantyPriod,
}

extension TileTypeExtension on TileType {
  String get title {
    switch (this) {
      case TileType.purchasePrice:
        return '購入価格';
      case TileType.purchaseDate:
        return '購入日';
      case TileType.warrantyPriod:
        return '保証期限';
    }
  }

  String priceFormatter(int? price) {
    if (price == null) {
      return '-';
    } else {
      final formatter = NumberFormat('#,###');
      return '${formatter.format(price)} 円';
    }
  }

  String dateFormatter(DateTime date) {
    return DateFormat.yMMMMd().format(date); // TODO: 日本語表示に直す
  }

  String getTrailingText(HitProduct item) {
    switch (this) {
      case TileType.purchasePrice:
        return priceFormatter(item.purchasePrice);
      case TileType.purchaseDate:
        return dateFormatter(item.purchaseDate);
      case TileType.warrantyPriod:
        return dateFormatter(item.warrantyPriod);
    }
  }
}
