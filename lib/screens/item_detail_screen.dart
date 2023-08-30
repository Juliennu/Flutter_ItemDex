import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/my_item_detail_listtile.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatelessWidget {
  // final HitProduct myItem;
  const ItemDetailScreen({
    super.key,
    // required this.myItem,
  });

  @override
  Widget build(BuildContext context) {
    final itemDexText = ItemDexText();

    return Consumer<HitProduct>(builder: (context, item, child) {
      return Scaffold(
        appBar: AppBar(
          title: itemDexText.createHeaderTitle('アイテム詳細'),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        // myItem.name,
                        item.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // myItem.brand.name,
                        item.brand.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 150,
                    width: 150,
                    // child: Image.network(myItem.image.medium),
                    child: Image.network(item.image.medium),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  padding: const EdgeInsets.all(4),
                  child: const Text(
                    'ユーザー入力欄',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const MyItemDetailListTile(
                    // myItem: item,
                    // myItem: productData.currentMyItemInfo,
                    // myItem: productData.updatePurchaseDate(myItem, date),
                    // updatePurchaseDateCallback: (date) {},
                    ),
                const Text('購入価格'),
                const Text('保証期限'),
                const Text('メモ'),
              ],
            )
          ],
        ),
      );
    });
  }
}
