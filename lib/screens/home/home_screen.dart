import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/app_state_service.dart';
import 'package:item_dex/screens/home/widget/my_item_sizedbox.dart';
import 'package:item_dex/screens/item_detail/item_detail_screen.dart';
import 'package:item_dex/screens/search/search_screen.dart';
import 'package:item_dex/widgets/item_dex_text.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateServiceProvider);

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
