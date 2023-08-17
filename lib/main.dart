import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:item_dex/models/product.dart';
// import 'package:intl/intl.dart';
import 'package:item_dex/screens/search_screen.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/product_sizedbox.dart';

Future<void> main() async {
  // 非同期処理のためmain関数をFutureに変更
  await dotenv.load(fileName: '.env'); // .envファイルを読み込み
  runApp(const MainApp());
}

// final token = dotenv.env['YAHOO_API_APP_ID'];
final itemDexText = ItemDexText();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget createRow() {
      return ProductSizedBox(
        hitProduct: HitProduct(
          'name',
          ImageURL(
              'https://firebasestorage.googleapis.com/v0/b/gs-expansion-test.appspot.com/o/unknown_person.png?alt=media'),
          Brand('brand'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('Item Dex'),
      ),
      body: Column(
        children: [
          createRow(),
          createRow(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SearchScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
