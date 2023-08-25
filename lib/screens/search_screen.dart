import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http; // httpという変数を通して、httpパッケージにアクセス
import 'package:item_dex/models/product.dart'; // 作成したモデル
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/product_sizedbox.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final itemDexText = ItemDexText();

    return Consumer<ProductData>(
      builder: (context, productData, child) {
        return Scaffold(
          appBar: AppBar(
            title: itemDexText.createHeaderTitle('商品検索'),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                child: TextField(
                  autocorrect: false,
                  autofocus: true,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                  decoration: const InputDecoration(
                    hintText: '商品名、メーカー名を入力',
                    icon: Icon(Icons.search),
                  ),
                  onSubmitted: (String value) async {
                    final result = await searchProduct(value);
                    productData.updateProductsSearchResult(result);
                  },
                ),
              ),
              Expanded(
                child: ListView(
                  children: productData.productsSearchResult
                      .map(
                        (hitProduct) => ProductSizedBox(
                          hitProduct: hitProduct,
                          dialogButtonOnTapCallback: () {
                            productData.addMyItem(hitProduct);
                          },
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

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
