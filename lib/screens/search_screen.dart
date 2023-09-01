import 'package:flutter/material.dart';
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/repositories/search.dart';
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
                    final result =
                        await SearchRepository().searchProduct(value);
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
}
