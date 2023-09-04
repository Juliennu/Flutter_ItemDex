import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/global_state.dart';
import 'package:item_dex/screens/item_detail_screen.dart';
import 'package:item_dex/screens/search_screen.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/my_item_sizedbox.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myItems = ref.read(GlobalState().myItemsProvider);
    final itemDexText = ItemDexText();

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('マイアイテム'),
      ),
      body: ListView(
        children: myItems
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
