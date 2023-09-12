enum TileType {
  purchasePrice,
  purchaseDate,
  warrantyPriod;
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
}
