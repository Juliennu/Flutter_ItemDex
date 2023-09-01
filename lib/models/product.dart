import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Info {
  final List<HitProduct> hitProducts;

  Info(
    this.hitProducts,
  );

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

class HitProduct extends ChangeNotifier {
  final String id = const Uuid().v4();
  final String name;
  final ImageURL image;
  final Brand brand;

  int? purchasePrice;
  final now = DateTime.now();
  late DateTime purchaseDate;
  late DateTime warrantyPriod;

  HitProduct({
    required this.name,
    required this.image,
    required this.brand,
    this.purchasePrice,
  }) {
    purchaseDate = now;
    warrantyPriod = DateTime(now.year + 1, now.month, now.day);
  }

  factory HitProduct.fromJson(Map<String, dynamic> json) {
    return HitProduct(
      name: json['name'] as String,
      image: ImageURL.fromJson(json['image']),
      brand: Brand.fromJson(json['brand']),
    );
  }

  void updateMyItem(
    int? purchasePrice,
    DateTime purchaseDate,
    DateTime warrantyPriod,
  ) {
    this.purchaseDate = purchaseDate;
    this.purchasePrice = purchasePrice;
    this.warrantyPriod = warrantyPriod;
    notifyListeners();
  }
}

class ImageURL {
  final String medium;

  ImageURL(
    this.medium,
  );

  // JSONからImageURLクラスに変換するファクトリコンストラクタ
  factory ImageURL.fromJson(Map<String, dynamic> json) {
    return ImageURL(json['medium'] as String);
  }
}

class Brand {
  final String name;

  Brand(
    this.name,
  );

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(json['name'] as String);
  }
}
