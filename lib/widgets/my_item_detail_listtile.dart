import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:item_dex/models/product.dart';
import 'package:item_dex/screens/select_date_screen.dart';
import 'package:provider/provider.dart';

class MyItemDetailListTile extends StatelessWidget {
  // final HitProduct myItem;
  // final Function updatePurchaseDateCallback;
  const MyItemDetailListTile({
    super.key,
    // required this.myItem,
    // required this.updatePurchaseDateCallback,
  });

  @override
  Widget build(BuildContext context) {
    // enum TileType {
    //   date,
    //   price,
    //   memo,
    // }
    String dateFormatter(DateTime date) {
      return DateFormat.yMMMMd().format(date); // TODO: 日本語表示に直す
    }

    return Consumer<HitProduct>(builder: (context, item, child) {
      return ListTile(
          leading: const Text('購入日'),
          trailing: Text(dateFormatter(item.purchaseDate)),
          onTap: () {
            // ハーフモーダル
            showModalBottomSheet(
              context: context,
              builder: (context) => const SelectDateScreen(
                  // myItem: item,
                  // updatePurchaseDate: (date) {
                  //   item.updateMyItem(item.purchasePrice, date,
                  //       item.warrantyPriod); // TODO: 変更した箇所だけ引数を渡せるようにしたい
                  // updatePurchaseDateCallback(date);
                  // },
                  ),
            );
          });
    });
  }
}
