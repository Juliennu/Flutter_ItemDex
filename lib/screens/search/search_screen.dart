import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/common/app_state_service.dart';
import 'package:item_dex/screens/search/search_screen_state.dart';
import 'package:item_dex/screens/search/search_screen_view_model.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/product_sizedbox.dart';

/// Private provider
/// Only to be used in this Screen
///
final _provider =
    StateNotifierProvider.autoDispose<SearchScreenViewModel, SearchScreenState>(
  (ref) => SearchScreenViewModel(),
);

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateServiceProvider);
    final state = ref.watch(_provider);

    final itemDexText = ItemDexText();

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('商品検索'),
      ),
      body: Column(
        children: [
          Stack(
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
                  onSubmitted: (String keyWord) async {
                    ref.read(_provider.notifier).isSearching = true;
                    await ref
                        .read(appStateServiceProvider.notifier)
                        .searchProduct(keyWord);
                    ref.read(_provider.notifier).isSearching = false;
                  },
                ),
              ),
              if (state.isSearching)
                const LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                  valueColor: AlwaysStoppedAnimation(Colors.red),
                  minHeight: 8,
                ),
            ],
          ),
          Expanded(
            child: ListView(
              children: appState.searchResults
                  .map(
                    (hitProduct) => ProductSizedBox(
                      hitProduct: hitProduct,
                      dialogButtonOnTapCallback: () {
                        print('商品情報: $hitProduct');
                        ref
                            .read(appStateServiceProvider.notifier)
                            .addToFavourites(hitProduct);
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
