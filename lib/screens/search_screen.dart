import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/global_state.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/product_sizedbox.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResultValue =
        ref.watch(GlobalState().searchResultsProvider.notifier);
    final myItems = ref.watch(GlobalState().myItemsProvider.notifier);
    final itemDexText = ItemDexText();

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
                final future =
                    ref.watch(GlobalState().searchResultFutureProvider(value));
                future.when(data: (data) {
                  searchResultValue.state = data;
                  print(value); // TODO: printされない
                }, error: (error, _) {
                  print('検索でエラーが発生しました: ${error.toString()}');
                }, loading: () {
                  const CircularProgressIndicator();
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: searchResultValue.state
                  .map(
                    (hitProduct) => ProductSizedBox(
                      hitProduct: hitProduct,
                      dialogButtonOnTapCallback: () {
                        print('商品情報: $hitProduct');
                        myItems.state.add(hitProduct);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
