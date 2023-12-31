import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/data/models/product.dart';
import 'package:item_dex/data/services/app_state_service.dart';
import 'package:item_dex/screens/item_detail/enums/tile_type.dart';
import 'package:item_dex/screens/item_detail/widgets/select_date/select_date.dart';
import 'package:item_dex/screens/item_detail/widgets/update_price/update_price.dart';

class MyItemDetailListTile extends ConsumerWidget {
  final TileType tileType;
  final String itemID;

  const MyItemDetailListTile({
    super.key,
    required this.tileType,
    required this.itemID,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(appStateServiceProvider);

    final HitProduct item =
        appState.myItems.firstWhere((item) => item.id == itemID);

    String priceFormatter(int? price) {
      if (price == null) {
        return '-';
      } else {
        final formatter = NumberFormat('#,###');
        return '${formatter.format(price)} 円';
      }
    }

    String dateFormatter(DateTime date) {
      return DateFormat.yMMMMd().format(date); // TODO: 日本語表示に直す
    }

    // TODO: Functionではなく、String get trailigText {...} の形にしたい
    String getTrailingText() {
      switch (tileType) {
        case TileType.purchasePrice:
          return priceFormatter(item.purchasePrice);
        case TileType.purchaseDate:
          return dateFormatter(item.purchaseDate);
        case TileType.warrantyPriod:
          return dateFormatter(item.warrantyPriod);
      }
    }

    Widget getModalWidget() {
      switch (tileType) {
        case TileType.purchasePrice:
          return UpdatePrice(
            onOKPressed: (price) {
              ref
                  .watch(appStateServiceProvider.notifier)
                  .updatePurchasePrice(itemID, price);
            },
          );
        case TileType.purchaseDate:
          return SelectDate(
            tileType: TileType.purchaseDate,
            selectedDate: item.purchaseDate,
            onDateTimeChanged: (date) {
              ref
                  .watch(appStateServiceProvider.notifier)
                  .updatePurchaseDate(itemID, date);
            },
          );
        case TileType.warrantyPriod:
          return SelectDate(
            tileType: TileType.warrantyPriod,
            selectedDate: item.warrantyPriod,
            onDateTimeChanged: (date) {
              ref
                  .watch(appStateServiceProvider.notifier)
                  .updateWarrantyDate(itemID, date);
            },
          );
      }
    }

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
        getTrailingText(),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      onTap: () {
        // ハーフモーダル
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return getModalWidget();
          },
        );
      },
    );
  }
}
