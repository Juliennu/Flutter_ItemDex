import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/models/tile_type.dart';
import 'package:item_dex/screens/select_date_screen.dart';
import 'package:provider/provider.dart';

class MyItemDetailListTile extends StatelessWidget {
  final TileType tileType;
  const MyItemDetailListTile({
    super.key,
    required this.tileType,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HitProduct>(
      builder: (context, item, child) {
        return ListTile(
          leading: Text(tileType.title),
          trailing: Text(tileType.getTrailingText(item)),
          onTap: () {
            // ハーフモーダル
            showModalBottomSheet(
              context: context,
              builder: (context) {
                if (tileType == TileType.purchasePrice) {
                  return const Placeholder(); // TODO: 数字用のキーボードを用意する
                } else {
                  return SelectDateScreen(
                      purchaseDate: item.purchaseDate,
                      warrantyPriod: item.warrantyPriod,
                      onDateTimeChanged: (date) {
                        if (tileType == TileType.purchaseDate) {
                          item.updateMyItem(
                              item.purchasePrice, date, item.warrantyPriod);
                        } else if (tileType == TileType.warrantyPriod) {
                          item.updateMyItem(
                              item.purchasePrice, item.purchaseDate, date);
                        }
                      });
                }
              },
            );
          },
        );
      },
    );
  }
}
