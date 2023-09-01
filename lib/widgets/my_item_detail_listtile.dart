import 'package:flutter/material.dart';
import 'package:item_dex/models/product_data.dart';
import 'package:item_dex/models/tile_type.dart';
import 'package:provider/provider.dart';

class MyItemDetailListTile extends StatelessWidget {
  final TileType tileType;
  final String itemID;
  const MyItemDetailListTile({
    super.key,
    required this.tileType,
    required this.itemID,
  });

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ProductData>();

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
        tileType.getTrailingText(appState, itemID),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        // ハーフモーダル
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return tileType.getWidget(appState, itemID);
          },
        );
      },
    );
  }
}
