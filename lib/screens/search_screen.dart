import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http; // httpという変数を通して、httpパッケージにアクセス
import 'package:item_dex/models/product.dart'; // 作成したモデル
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/product_sizedbox.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final itemDexText = ItemDexText();
  List<HitProduct> hitProducs = [];

  @override
  Widget build(BuildContext context) {
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
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: const InputDecoration(
                hintText: '商品名を入力',
                icon: Icon(Icons.search),
              ),
              onSubmitted: (String value) async {
                final result = await searchProduct(value);
                setState(() {
                  hitProducs = result;
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: hitProducs
                  .map((hitProduct) => ProductSizedBox(hitProduct: hitProduct))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<HitProduct>> searchProduct(String keyword) async {
    // 1. http通信に必要なデータを準備をする
    final String token = dotenv.env['YAHOO_API_APP_ID'] ?? '';
    // アクセストークンを含めてリクエストを送信
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
      // 3. 戻り値をHitsクラスの配列に変換
      // 4. 変換したHitsクラスの配列を返す

      // final List<dynamic> body = jsonDecode(response
      //     .body); // ここでエラー _TypeError (type '_Map<String, dynamic>' is not a subtype of type 'List<dynamic>')
      // print(body);
      // return body.map((dynamic json) => Info.fromJson(json)).toList();
      final body = jsonDecode(response.body);
      final info = Info.fromJson(body);
      print(info);
      return info.hitProducts;
    } else {
      return []; // 200以外の場合は空のリストを返す
    }
  }

  // Future<List<Info>> searchProduct(String keyword) async {
  //   // 1. http通信に必要なデータを準備をする
  //   final String token = dotenv.env['YAHOO_API_APP_ID'] ?? '';
  //   // アクセストークンを含めてリクエストを送信
  //   final uri = Uri.https(
  //     'shopping.yahooapis.jp',
  //     '/ShoppingWebService/V3/itemSearch',
  //     {
  //       'appid': token,
  //       'query': keyword,
  //     },
  //   );
  //   // 2. Yahoo APIにリクエストを送る
  //   final http.Response response = await http.get(
  //     uri,
  //   );
  //   print('URL: ${response.request}');

  //   if (response.statusCode == 200) {
  //     // 3. 戻り値をHitsクラスの配列に変換
  //     // 4. 変換したHitsクラスの配列を返す
  //     final List<dynamic> body = jsonDecode(response
  //         .body); // ここでエラー _TypeError (type '_Map<String, dynamic>' is not a subtype of type 'List<dynamic>')
  //     print(body);

  //     return body.map((dynamic json) => Info.fromJson(json)).toList();
  //   } else {
  //     return []; // 200以外の場合は空のリストを返す
  //   }
  // }
}
