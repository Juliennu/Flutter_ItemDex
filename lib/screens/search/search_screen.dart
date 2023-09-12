import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:item_dex/data/repositories/products_repository.dart';
import 'package:item_dex/data/services/app_state_service.dart';
import 'package:item_dex/screens/search/search_screen_state.dart';
import 'package:item_dex/screens/search/search_screen_view_model.dart';
import 'package:item_dex/screens/search/widget/product_sizedbox.dart';
import 'package:item_dex/widgets/item_dex_text.dart';

/// Private provider
/// Only to be used in this Screen
///
final _provider =
    StateNotifierProvider.autoDispose<SearchScreenViewModel, SearchScreenState>(
  (ref) => SearchScreenViewModel(
    productsRepository: ProductsRepositoryImpl(),
  ),
);

class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(_provider);

    final itemDexText = ItemDexText();

    Widget searchTextFieldContents() {
      return Stack(
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
                await ref.read(_provider.notifier).searchProduct(keyWord);
                ref.read(_provider.notifier).isSearching = false;
              },
            ),
          ),
          if (state.isSearching)
            LinearProgressIndicator(
              backgroundColor: Colors.transparent,
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).indicatorColor),
              minHeight: 6,
            ),
        ],
      );
    }

    Widget searchResultListContents() {
      return Expanded(
        child: ListView(
          children: state.searchResults
              .map(
                (hitProduct) => ProductSizedBox(
                  hitProduct: hitProduct,
                  dialogButtonOnTapCallback: () {
                    ref
                        .read(appStateServiceProvider.notifier)
                        .addToFavourites(hitProduct);
                  },
                ),
              )
              .toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: itemDexText.createHeaderTitle('商品検索'),
      ),
      body: Column(
        children: [
          searchTextFieldContents(),
          searchResultListContents(),
        ],
      ),
    );
  }
}
