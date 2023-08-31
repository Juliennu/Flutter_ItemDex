import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/models/tile_type.dart';
import 'package:item_dex/widgets/item_dex_text.dart';
import 'package:item_dex/widgets/my_item_detail_listtile.dart';
import 'package:provider/provider.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

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
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Textを改行して表示
                      Flexible(
                        child: Text(
                          item.name,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.brand.name,
                        maxLines: 3,
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
                    child: Image.network(item.image.medium),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity, // 横幅いっぱいに広げる
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
                const MyItemDetailListTile(tileType: TileType.purchasePrice),
                const MyItemDetailListTile(tileType: TileType.purchaseDate),
                const MyItemDetailListTile(tileType: TileType.warrantyPriod),
              ],
            )
          ],
        ),
      );
    });
  }
}
