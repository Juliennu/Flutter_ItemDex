class Info {
  final List<HitProduct> hitProducts;

  Info(this.hitProducts);

  factory Info.fromJson(dynamic json) {
    return Info(
      // HitProduct.fromJson(json['hits']),
      // json['hits'].cast<HitProduct>() as List<HitProduct>,
      json['hits'].cast<HitProduct>(),
    );
  }
}

class HitProduct {
  final String name;
  final ImageURL image;
  final Brand brand;

  HitProduct(this.name, this.image, this.brand);

  factory HitProduct.fromJson(dynamic json) {
    return HitProduct(
      json['name'] as String,
      ImageURL.fromJson(json['image']),
      Brand.fromJson(json['brand']),
    );
  }
}

class ImageURL {
  final String medium;

  ImageURL(this.medium);

  // JSONからImageクラスに変換するファクトリコンストラクタ
  factory ImageURL.fromJson(dynamic json) {
    return ImageURL(json['medium'] as String);
  }
}

class Brand {
  final String name;

  Brand(this.name);

  factory Brand.fromJson(dynamic json) {
    return Brand(json['name'] as String);
  }
}
