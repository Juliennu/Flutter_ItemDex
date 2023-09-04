import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:item_dex/models/product.dart';

class ProductsRepository {
  Future<List<HitProduct>> searchProduct(String keyword) async {
    // 1. http通信に必要なデータを準備をする
    final String token = dotenv.env['YAHOO_API_APP_ID'] ?? '';
    final uri = Uri.https(
      'shopping.yahooapis.jp',
      '/ShoppingWebService/V3/itemSearch',
      {
        'appid': token,
        'query': keyword,
      },
    );
    // 2. Yahoo APIにリクエストを送る
    final http.Response response = await http.get(
      uri,
    );

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final info = Info.fromJson(body);
      return info.hitProducts;
    } else {
      return []; // 200以外の場合は空のリストを返す
    }
  }
}
