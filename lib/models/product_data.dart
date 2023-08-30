import 'package:flutter/foundation.dart';
import 'package:item_dex/models/product.dart';

class ProductData extends ChangeNotifier {
  // Search
  var _productsSearchResult = <HitProduct>[];
  List<HitProduct> get productsSearchResult => _productsSearchResult;

  void updateProductsSearchResult(List<HitProduct> products) {
    _productsSearchResult = products;
    notifyListeners();
  }

  // My Item
  final _myItems = <HitProduct>[
    HitProduct(
      name: 'iPhone11',
      image: ImageURL(
          'https://www.backmarket.co.jp/cdn-cgi/image/format%3Dauto%2Cquality%3D75%2Cwidth%3D640/https://d7vo8p9pwm287.cloudfront.net/product_images/None_88f5c151-6c9c-47e5-bb00-cb415b8c7f11.jpg'),
      brand: Brand('Apple'),
    )
  ];
  List<HitProduct> get myItems => _myItems;

  void addMyItem(HitProduct product) {
    _myItems.add(product);
    notifyListeners();
  }

  void deleteMyItem(HitProduct product) {
    _myItems.remove(product);
    notifyListeners();
  }

  // FIXME: name, image. brand など変更してほしくないところも変更できてしまうので、用途別にファンクションを分けたい。
  // void updateItemDetail(HitProduct updatedProduct) {
  //   _myItems.map((myItem) {
  //     if (myItem.name == updatedProduct.name) {
  //       myItem = updatedProduct;
  //     }
  //   });
  //   notifyListeners();
  // }

  // void updatePurchasePrice(HitProduct item, int price) {
  //   item.updatePurchasePrice(price);
  //   notifyListeners();
  // }

  // void updatePurchaseDate(HitProduct item, DateTime date) {
  //   item.updatePurchaseDate(date);
  //   notifyListeners();
  // }

  // void updateWarrantyPriod(HitProduct item, DateTime date) {
  //   item.updateWarrantyPriod(date);
  //   notifyListeners();
  // }

  // HitProduct currentMyItemInfo(HitProduct item) {
  //   return _myItems.first(item);
  // }

  // HitProduct currentMyItemInfo(HitProduct item) {
  //   item.updateMyItem(item)
  // }

  void updateMyItem(
    HitProduct item,
    int purchasePrice,
    DateTime purchaseDate,
    DateTime warrantyPriod,
  ) {
    item.updateMyItem(purchasePrice, purchaseDate, warrantyPriod);
    notifyListeners();
  }
}
