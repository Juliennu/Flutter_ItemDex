import 'package:flutter/material.dart';
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/screens/item_detail_screen.dart';
import 'package:item_dex/screens/search_screen.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/my_item_sizedbox.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                      MaterialPageRoute(builder: (context) {
                        return ItemDetailScreen(
                          item: myItem,
                        );
                      }),
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
