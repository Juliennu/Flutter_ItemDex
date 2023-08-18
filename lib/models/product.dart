class Info {
  final List<HitProduct> hitProducts;

  Info(this.hitProducts);

  factory Info.fromJson(Map<String, dynamic> json) {
    final hitList = json['hits'];
    List<HitProduct> hitProducts = hitList
        .map((item) => HitProduct.fromJson(item))
        .toList()
        .cast<HitProduct>();
    return Info(
      hitProducts,
    );
  }
}

class HitProduct {
  final String name;
  final ImageURL image;
  final Brand brand;

  HitProduct(this.name, this.image, this.brand);

  factory HitProduct.fromJson(Map<String, dynamic> json) {
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

  // JSONからImageURLクラスに変換するファクトリコンストラクタ
  factory ImageURL.fromJson(Map<String, dynamic> json) {
    return ImageURL(json['medium'] as String);
  }
}

class Brand {
  final String name;

  Brand(this.name);

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(json['name'] as String);
  }
}
