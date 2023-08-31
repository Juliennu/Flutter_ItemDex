import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/screens/select_date_screen.dart';
import 'package:item_dex/screens/update_price_screen.dart';

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

  String _priceFormatter(int? price) {
    if (price == null) {
      return '-';
    } else {
      final formatter = NumberFormat('#,###');
      return '${formatter.format(price)} 円';
    }
  }

  String _dateFormatter(DateTime date) {
    return DateFormat.yMMMMd().format(date); // TODO: 日本語表示に直す
  }

  String getTrailingText(HitProduct item) {
    switch (this) {
      case TileType.purchasePrice:
        return _priceFormatter(item.purchasePrice);
      case TileType.purchaseDate:
        return _dateFormatter(item.purchaseDate);
      case TileType.warrantyPriod:
        return _dateFormatter(item.warrantyPriod);
    }
  }

  Widget getWidget(HitProduct item) {
    switch (this) {
      case TileType.purchasePrice:
        return UpdatePriceScreen(
          onOKPressed: (price) {
            item.updateMyItem(price, item.purchaseDate, item.warrantyPriod);
          },
        );
      case TileType.purchaseDate:
        return SelectDateScreen(
          purchaseDate: item.purchaseDate,
          warrantyPriod: item.warrantyPriod,
          onDateTimeChanged: (date) {
            item.updateMyItem(item.purchasePrice, date, item.warrantyPriod);
          },
        );
      case TileType.warrantyPriod:
        return SelectDateScreen(
          purchaseDate: item.purchaseDate,
          warrantyPriod: item.warrantyPriod,
          onDateTimeChanged: (date) {
            item.updateMyItem(item.purchasePrice, item.purchaseDate, date);
          },
        );
    }
  }
}
