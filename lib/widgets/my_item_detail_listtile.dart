import 'package:flutter/material.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/models/tile_type.dart';
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
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1,
            ),
          ),
          leading: Text(
            tileType.title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          trailing: Text(
            tileType.getTrailingText(item),
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          onTap: () {
            // ハーフモーダル
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return tileType.getWidget(item);
              },
            );
          },
        );
      },
    );
  }
}
