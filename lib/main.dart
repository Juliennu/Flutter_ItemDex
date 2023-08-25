import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/screens/item_detail_screen.dart';
import 'package:item_dex/screens/search_screen.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/my_item_sizedbox.dart';
import 'package:provider/provider.dart';

// 非同期処理のためmain関数をFutureに変更
Future<void> main() async {
  await dotenv.load(fileName: '.env'); // .envファイルを読み込み
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductData(),
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ProductData>();
    final itemDexText = ItemDexText();

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('マイアイテム'),
      ),
      body: ListView(
        children: appState.myItems
            .map((myItem) => MyItemSizedBox(
                  hitProduct: myItem,
                  myItemTappedCallback: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ItemDetailScreen(
                          myItem: myItem,
                        ),
                      ),
                    );
                  },
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
